//
//  CivilizationViewController.m
//  文明嘉兴
//
//  Created by dc004 on 16/6/24.
//
//

#import "CivilizationViewController.h"

#import "YSLContainerViewController.h"
#import "QRcodeViewController.h"
#import "NotifyViewController.h"
#import "LinkViewController.h"
#import "ShareViewController.h"
@interface CivilizationViewController ()

@end

@implementation CivilizationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    QRcodeViewController *qrVC= [self.storyboard instantiateViewControllerWithIdentifier:@"QRcodeViewController"];
    qrVC.title = @"二维码";
    NotifyViewController *noVC= [self.storyboard instantiateViewControllerWithIdentifier:@"NotifyViewController"];
    noVC.title = @"通知公告";
    LinkViewController *liVC= [self.storyboard instantiateViewControllerWithIdentifier:@"LinkViewController"];
    liVC.title = @"友情链接";
    ShareViewController *shVC= [self.storyboard instantiateViewControllerWithIdentifier:@"ShareViewController"];
    shVC.title = @"分享好友";
    NSArray *arrVC = @[qrVC,noVC,liVC,shVC];
    
    YSLContainerViewController * conntainerVC =  [[YSLContainerViewController alloc]initWithControllers:arrVC topBarHeight:20 parentViewController:self];
    
    conntainerVC.menuItemSelectedTitleColor= [UIColor colorWithRed:0.99 green:0.47 blue:0.21 alpha:1.00];
    conntainerVC.menuIndicatorColor= [UIColor colorWithRed:0.99 green:0.47 blue:0.21 alpha:1.00];
    conntainerVC.menuItemTitleColor= [UIColor blackColor];
    [self.view addSubview:conntainerVC.view];
}



@end
