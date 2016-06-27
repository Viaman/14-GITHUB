//
//  LinkDetailViewController.m
//  文明嘉兴
//
//  Created by dc004 on 16/6/24.
//
//

#import "LinkDetailViewController.h"

@interface LinkDetailViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *LableTitle;


@end

@implementation LinkDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.LableTitle.text = @"详情";
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    int a = [[user valueForKeyPath:@"value" ]intValue];
     NSArray *arr=@[@"http://www.cnjxol.com/index.htm",@"http://jx.wenming.cn/",@"http://www.zjwmw.com/",@"http://www.zjol.com.cn/",@"http://www.cncn.org.cn/",@"http://www.kids21.cn/",@"http://www.hcyjw.cn/",@"http://nhnews.zjol.com.cn/nhnews/nhwm/",@"http://jxxznews.zjol.com.cn/xznews/xzwmw/",@"http://news.163.com/10/0420/17/64NT2UF100014AED.html",@"http://wmw.tx.gov.cn/web/",@"http://zjhn.wenming.cn/",@"http://gfjy.jiaxing.gov.cn/",@"http://www.cnjxol.com/topic/qzlx/",@"http://www.nhyouth.gov.cn/"];
    
    NSURL *ure = [NSURL URLWithString:arr[a]];
    NSURLRequest *request=[NSURLRequest requestWithURL:ure];
    [self.webView loadRequest:request];
}

- (IBAction)back:(id)sender {
    //返回上一页面
    [self.navigationController popViewControllerAnimated:YES];
    

}

@end
