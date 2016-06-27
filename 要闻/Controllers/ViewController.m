//
//  ViewController.m
//  文明嘉兴
//
//  Created by dc004 on 16/6/24.
//
//
#import "ViewController.h"
#import "News.h"
#import "Banner.h"
#import "DetailViewController.h"
#import "ThemeTableViewCell.h"
#import "NewsTableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,SDCycleScrollViewDelegate>
{
        int pageNum;
        int page;//分类iD
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

@property(nonatomic,strong)NSArray *bannerArr;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    pageNum = 1;
    page=1;
    [self.newsTableView registerClass:[ThemeTableViewCell class] forCellReuseIdentifier:@"newsCell"];

    [self.newsTableView registerClass:[NewsTableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.newsTableView.rowHeight = 100;//每一行都是固定高度
    //请求banner数据
    [Banner getImageDataBanner:page];
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
        
        [News getNewsDataWithPageNum:pageNum andCategoryPage:page];

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
        [News getNewsDataWithPageNum:++pageNum andCategoryPage:page];

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
    self.newsTableView.dataSource=self;
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
    
    //判断这个object是不是数组
    if ([notification.object isKindOfClass:[NSArray class]]) {
        //给数组赋值
        self.bannerArr=notification.object;
    }
    NSArray *lableGroup=[self.bannerArr valueForKey:@"title"];
    NSArray *imagerGroup=[self.bannerArr valueForKey:@"imageurl"];
    //对无限轮播的图片数组赋值
    self.cycleScrollView.imageURLStringsGroup=imagerGroup;
    //对无限轮播的文字数组赋值
    self.cycleScrollView.titlesGroup=lableGroup;
    [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
}

#pragma mark 设置TableView的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.tableViewArray.count;
}
#pragma mark 绘制cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (page==7) {
        ThemeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"newsCell"];
        //设置图片
        [cell.image setImageWithURL:[NSURL URLWithString:self.tableViewArray[indexPath.row].image] placeholderImage:[UIImage imageNamed:@"1111"]];
        //--------截取时间段----------
        NSString *time=self.tableViewArray[indexPath.row].issuestime;
        NSRange range = {5,time.length-5};
        //显示时间
        cell.timelabel.text=[time substringWithRange:range];
        //显示标题
        cell.titlelabel.text=self.tableViewArray[indexPath.row].title;

        return cell;
    }else{
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
}
#pragma mark-设置CategoryId的参数
-(void)setPageParameter:(int)pageNumber{
    page=pageNumber;
    //开始刷新
    [self.newsTableView.mj_header beginRefreshing];
}
#pragma mark tableViewCell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (page==7) {
        return 150;
    }else{
        return 100;
    }
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
#pragma mark 选中某一行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取数据
    News *news = self.tableViewArray[indexPath.row];
    DetailViewController * dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    //根据文档得到计算公式，最后的-1取消，因为row就是从0开始的
    int tempNum = (pageNum-1)*10+(int)indexPath.row;
        int detailPageNum=page;
    [dvc setParams:@{
                        @"newsId":news.newsId,
                        @"categoryFk":@(detailPageNum),
                        @"pageNum":@(tempNum)
                        }];

    [self.navigationController pushViewController:dvc animated:YES];
}
#pragma  mark- 释放通知
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:GetNewsDataNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:GetBannerDataNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


@end
