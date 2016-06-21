//
//  ViewController.m
//  NewsWork-张敏
//
//  Created by dc009 on 16/6/4.
//  Copyright © 2016年 via.man. All rights reserved.
//

#import "ViewController.h"
#import "News.h"
#import "Banner.h"
#import "DetailViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,SDCycleScrollViewDelegate>
{
    int pageNum;
}
@property (weak, nonatomic) IBOutlet UITableView *newsTableView;
//接受数据 数组
@property(nonatomic,strong)NSMutableArray<News *> *tableViewArray;
//接受轮播图数据
@property(nonatomic,strong)NSMutableArray*imageArray;
//图片地址
@property(nonatomic,strong)NSMutableArray*arrayImage;
//标题
@property(nonatomic,strong)NSMutableArray*arrayTitle;
//轮播图标题
@property(nonatomic,strong)UILabel *lable;

@property(nonatomic,strong)SDCycleScrollView *cycleScrollView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.newsTableView registerClass:[NewsTableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.newsTableView.rowHeight = 77;//每一行都是固定高度
    
    [Banner getImageDataBanner];
    
    
    
    //添加通知，当获取到数据是进行提示
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(handleNotificationByNews:)
     name:GetNewsDataNotification
     object:nil];
    
    //添加通知，当获取到数据是进行提示
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(handleNotificationByBanner:)
     name:GetBannerDataNotification
     object:nil];
   
//    下拉刷新
    MJRefreshGifHeader *header  = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        pageNum = 1;
        [News getNewsDataWithPageNum:pageNum];
    }];
    NSMutableArray*imageUp = [NSMutableArray array];
    for (int i = 1; i<=8; i++) {
        UIImage *imUp = [UIImage imageNamed:[NSString stringWithFormat:@"%i.tiff",i]];
        [imageUp addObject:imUp];
    }
         [header setImages:imageUp forState:MJRefreshStatePulling];
      self.newsTableView.mj_header = header;
    //开始刷新
    [self.newsTableView.mj_header beginRefreshing];
    //上拉刷新
    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
        [News getNewsDataWithPageNum:++pageNum];
    }];
    NSMutableArray*imageDown = [NSMutableArray array];
    for (int i = 1; i<=12; i++) {
        UIImage *imDown = [UIImage imageNamed:[NSString stringWithFormat:@"0%i.tiff",i]];
        [imageDown addObject:imDown];
    }
   
    [footer setImages:imageDown forState:MJRefreshStateRefreshing];
      self.newsTableView.mj_footer = footer;
}
#pragma mark 处理获取新闻数据时的通知
- (void) handleNotificationByNews:(NSNotification *)notification
{
    //判断是否第一页
    if (pageNum == 1) {
        self.tableViewArray = [NSMutableArray array];
    }
    if ([notification.object isKindOfClass:[NSArray class]]) {
        
        [self.tableViewArray addObjectsFromArray:notification.object];
    }
    [self.newsTableView reloadData];//刷新表格上面的数据
    //停止加载数据状态
    [self.newsTableView.mj_header endRefreshing];
    [self.newsTableView.mj_footer endRefreshing];
    self.newsTableView.tableHeaderView = self.cycleScrollView;
}
#pragma mark 处理获取轮播图数据时的通知
- (void) handleNotificationByBanner:(NSNotification *)notification
{
    self.imageArray = [NSMutableArray array];
    [self.imageArray addObjectsFromArray:notification.object];
    
    [self.newsTableView reloadData];
}

#pragma mark 设置TableView的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.tableViewArray.count;
}
#pragma mark 绘制cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsTableViewCell * cell  = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    //从array里面取数据
    News *news = self.tableViewArray[indexPath.row];
    [cell.newsImage setImageWithURL:[NSURL URLWithString:news.image] placeholderImage:[UIImage imageNamed:@"1111"]];
    cell.newsTitle.text = news.title;
    NSString *time = news.issuestime;
    //截取 月-日
    NSRange range = {5,time.length-5};
    cell.newsTime.text = [time substringWithRange:range];
    cell.newsLaud.text = [NSString stringWithFormat:@"%@",news.praiseNum];
    cell.newsComment.text = [NSString stringWithFormat:@"%@",news.browseNum];

    return cell;
}
#pragma mark 重新SDCycleScrollView的方法
-(SDCycleScrollView *)cycleScrollView
{
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, 375, 200) delegate:self placeholderImage:[UIImage imageNamed:@"22222"]];
    self.arrayImage = [self.imageArray valueForKey:@"imageurl"];
    self.arrayTitle = [self.imageArray valueForKey:@"title"];
    _cycleScrollView.pageControlStyle =SDCycleScrollViewPageContolAlimentCenter;
    _cycleScrollView.imageURLStringsGroup = _arrayImage;
    _cycleScrollView.titlesGroup = _arrayTitle;
    _cycleScrollView.titleLabelHeight = 50.f;
    _cycleScrollView.pageControlDotSize =CGSizeMake(3,3);
    
    
    return _cycleScrollView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *dvc = [[DetailViewController alloc]init];
    
    [self.navigationController pushViewController:dvc animated:YES];
}


@end
