//
//  CivilizationViewController.m
//  NewsWork-张敏
//
//  Created by dc009 on 16/6/22.
//  Copyright © 2016年 via.man. All rights reserved.
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
    
    conntainerVC.menuItemSelectedTitleColor= [UIColor redColor];
    conntainerVC.menuIndicatorColor= [UIColor redColor];
    conntainerVC.menuItemTitleColor= [UIColor blackColor];
    [self.view addSubview:conntainerVC.view];
}



@end
