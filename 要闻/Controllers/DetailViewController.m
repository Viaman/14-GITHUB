//
//  DetailViewController.m
//  文明嘉兴
//
//  Created by dc004 on 16/6/24.
//
//

#import "DetailViewController.h"
#import "News.h"

@interface DetailViewController ()<UIWebViewDelegate>
{
    UIView *vLoging;//覆盖屏幕
}

@property (weak, nonatomic) IBOutlet UIScrollView *svContent;

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@property (weak, nonatomic) IBOutlet UILabel *lbFrom;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic,strong) AFHTTPSessionManager *manager;

@property (nonatomic,strong) MBProgressHUD * hud;

@end

@implementation DetailViewController

#pragma mark UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //拦截网页中的图片  并修改图片大小
    [self.webView stringByEvaluatingJavaScriptFromString:
     @"var script = document.createElement('script');"
     "script.type = 'text/javascript';"
     "script.text = \"function ResizeImages() { "
     "var myimg,oldwidth;"
     "var maxwidth=450;" //缩放系数
     "for(i=0;i <document.images.length;i++){"
     "myimg = document.images[i];"
     "if(myimg.width > maxwidth){"
     "oldwidth = myimg.width;"
     "myimg.width = 300;"
     "myimg.height = 200;"
     "}"
     "}"
     "}\";"
     "document.getElementsByTagName('head')[0].appendChild(script);"];
    
    //执行一段JavaScript代码
    [self.webView stringByEvaluatingJavaScriptFromString:@"ResizeImages();"];
    
    //获取HTML内容的高度
    CGFloat height = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue];
    CGRect frame = webView.frame;
    frame.size.height = height+10;
    
    self.webView.frame = frame;
    //设置滚动视图的ContentSize
    self.svContent.contentSize = CGSizeMake(320, frame.origin.y+height+10);
    
    
    [self.view layoutIfNeeded];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //左滑返回
    self.navigationController.interactivePopGestureRecognizer.delegate=(id)self;
    
    vLoging = [[UIView alloc]initWithFrame:SCREEN_BOUNDS];
    vLoging.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:vLoging];
    
    self.webView.delegate = self;
    self.webView.userInteractionEnabled = NO;

    //接口只支持POST
    [self.manager POST:POST_getNewsDetailById
            parameters:self.params
              progress:nil
               success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                   if ([responseObject[@"result"] isEqualToNumber:@0]) {
                       NSDictionary *data = responseObject[@"data"];
                       
                       News *news = [News mj_objectWithKeyValues:data];
                       self.lblTitle.text = news.titleNews;
                       self.lbFrom.text = [@"发布日期:" stringByAppendingFormat:@"%@         来源:%@",news.issuestime,news.source];
                       self.lbFrom.adjustsFontSizeToFitWidth = YES;
                       [self.webView loadHTMLString:news.content baseURL:nil];
                       
                       [vLoging removeFromSuperview];
                       
                       self.hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
                       self.hud.label.text=@"加载中";
                       [self.hud hideAnimated:YES ];
                       
                   }else{
                       NSLog(@"请求错误：%@",responseObject[@"message"]);
                   }
               } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                   NSLog(@"出错了:%@",error);
               }];
    
    
}

- (AFHTTPSessionManager *)manager
{
    if (_manager) {
        return _manager;
    }
    _manager = [AFHTTPSessionManager manager];
    //请求的时候要使用JSON数据序列化
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    return _manager;
}


@end
