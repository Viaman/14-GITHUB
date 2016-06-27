//
//  HistoryViewController.m
//  文明嘉兴
//
//  Created by dc004 on 16/6/24.
//
//

#import "HistoryViewController.h"

@interface HistoryViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property (nonatomic,strong) MBProgressHUD * hud;

@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.label.text=@"加载中";
    

    NSURL *url = [NSURL URLWithString: @"http://weibo.com/u/2852517300?is_hot=1"];
    NSString *body = [NSString stringWithFormat: @"arg1=%@&arg2=%@", @"val1",@"val2"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url];
    [request setHTTPMethod: @"POST"];
    [request setHTTPBody: [body dataUsingEncoding: NSUTF8StringEncoding]];
    [self.hud hideAnimated:YES afterDelay:2.5];
    [self.webview loadRequest: request];
    
}


@end
