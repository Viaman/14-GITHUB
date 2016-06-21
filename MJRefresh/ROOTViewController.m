//
//  ROOTViewController.m
//  NewsWork-张敏
//
//  Created by dc009 on 16/6/15.
//  Copyright © 2016年 via.man. All rights reserved.
//

#import "ROOTViewController.h"
#import "YSLContainerViewController.h"
#import "ViewController.h"
@interface ROOTViewController ()

@end

@implementation ROOTViewController

- (void)viewDidLoad {
    [super viewDidLoad]; 
//    ViewController *vcOne =
//    [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
//    [self addChildViewController:vcOne];
//    vcOne.title=@"文明日报";
//    NSMutableArray *array = [NSMutableArray arrayWithObject:vcOne];
//    for (int i =1; i<8; i++) {
//        UIViewController *vc = [[UIViewController alloc]init];
//        vc.title = titleArray[i-1];
//        [array addObject:vc];
//    }
    NSArray *titleArray = @[@"文明日报",@"道德模范",@"文明创建",@"志愿服务",@"未成年人",@"区县传真",@"主题活动",@"我们的节日"];
    NSMutableArray *array = [NSMutableArray array];
    for (int i=0; i<8; i++) {
        ViewController *vcOne =
        [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self addChildViewController:vcOne];
        [array addObject:vcOne];
        vcOne.title = titleArray[i];

    }
    float statusHeight = [[UIApplication sharedApplication]statusBarFrame].size.height;
    float navigationHeight =self.navigationController.navigationBar.frame.size.height;
    YSLContainerViewController * conntainerVC =  [[YSLContainerViewController alloc]initWithControllers:array topBarHeight:statusHeight+navigationHeight  parentViewController:self];
    [self.view addSubview:conntainerVC.view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
