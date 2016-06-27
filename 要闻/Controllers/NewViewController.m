//
//  NewViewController.m
//  文明嘉兴
//
//  Created by dc004 on 16/6/24.
//
//

#import "NewViewController.h"
#import "ViewController.h"
#import "NewsSort.h"

@interface NewViewController ()<YSLContainerViewControllerDelegate>

@property(nonatomic,strong)NSMutableArray *categoryArr;
@property (nonatomic,strong) MBProgressHUD * hud;

@end

@implementation NewViewController

//隐藏导航条
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
  

        //发送一个通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getNewsSortManager:) name:GetNewsCategoryNotification object:nil];
    //请求新闻分类
    [NewsSort getNewsSort];
}
#pragma mark-获取新闻分类的通知回调方法,将数组中的分类名称给数组categoryArr
-(void)getNewsSortManager:(NSNotification *)notification{
    
    if ([notification.object isKindOfClass:[NSArray class]]) {
        for (NewsSort *obj in notification.object) {
            [self.categoryArr addObject:obj.categoryName];
        }
    }
    //实例化8个控制器
    NSMutableArray <UIViewController *>*controllerArr=[NSMutableArray array];
    for (int i=0; i<self.categoryArr.count-1; i++) {
        ViewController *one=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        one.title=self.categoryArr[i];
        [controllerArr addObject:one];
    }
    //实现分段控制的类库
    YSLContainerViewController *controller=[[YSLContainerViewController alloc]initWithControllers:controllerArr topBarHeight:20 parentViewController:self];
    controller.menuBackGroudColor=[UIColor orangeColor];
    controller.menuItemSelectedTitleColor=[UIColor redColor];
    controller.delegate=self;
    [self.view addSubview:controller.view];
    
    self.hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.label.text=@"加载中";
    [self.hud hideAnimated:YES afterDelay:2.5];
}

#pragma mark -- YSLContainerViewControllerDelegate
- (void)containerViewItemIndex:(NSInteger)index currentController:(ViewController *)controller
{
    [controller setPageParameter:(int)index+1];
}
#pragma categoryArr进行懒加载
-(NSMutableArray *)categoryArr{
    if (!_categoryArr) {
        _categoryArr=[NSMutableArray array];
    }
    return _categoryArr;
}
#pragma mark 移除通知
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:GetNewsCategoryNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
