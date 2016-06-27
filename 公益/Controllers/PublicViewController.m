//
//  PublicViewController.m
//  文明嘉兴
//
//  Created by dc004 on 16/6/24.
//
//

#import "PublicViewController.h"
#import "Getpass.h"

@interface PublicViewController ()<SDCycleScrollViewDelegate>
{
    float hight;
}
@property(nonatomic,strong)SDCycleScrollView *cycleScrollView;
@property(nonatomic,strong)NSMutableArray *imageArray;
@property(nonatomic,strong)NSMutableArray *titleArray;

@end

@implementation PublicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Getpass getPass];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(play:)
     name:GetPassDataNotification
     object:nil];
    
}
-(void) play: (NSNotification *)notification{
    //判断notification.object是否为数组
    if ([notification.object isKindOfClass:[NSArray class]]) {
        //将数据添加到相应的数组中
        for (Getpass *obj in notification.object) {
            [self.titleArray addObject:obj.title];
            [self.imageArray addObject:obj.imageurl];
        }
    }
    //实例化无限轮播
    SDCycleScrollView *cycle=[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-100) imageURLStringsGroup:self.imageArray];
    cycle.titlesGroup=self.titleArray;
    cycle.titleLabelHeight=50;
    [cycle sizeToFit];
    [self.view addSubview:cycle];
    
    
}
#pragma set-数组的懒加载
-(NSMutableArray *)titleArray{
    if (!_titleArray) {
        _titleArray=[NSMutableArray array];
    }
    return _titleArray;
}

-(NSMutableArray *)imageArray{
    if (!_imageArray) {
        _imageArray=[NSMutableArray array];
    }
    return _imageArray;
}
#pragma mark-移除通知
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:POST_getPsas object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
