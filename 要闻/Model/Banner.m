//
//  Banner.m
//  文明嘉兴
//
//  Created by dc004 on 16/6/24.
//
//

#import "Banner.h"

@implementation Banner

+(void)getImageDataBanner:(int)page{
[[[self class]alloc]getImageDataBanner:page];
}
-(void)getImageDataBanner:(int)page
{
    NSDictionary *dict = @{
                           @"categoryId":@(page)
                           };
    
    [self.manager POST:POST_getBanner parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject[@"result"]isEqualToNumber:@0]) {
            
            NSArray *arrData = responseObject[@"data"];
            NSArray *resultBanner = [Banner mj_objectArrayWithKeyValuesArray:arrData];
            //发送通知，已经加载到了数据
            [[NSNotificationCenter defaultCenter] postNotificationName:GetBannerDataNotification object:resultBanner];
            
        }else{
            NSLog(@"请求错误:%@",responseObject[@"message"]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"错误:%@",error.localizedDescription);
    }];

}
- (AFHTTPSessionManager *)manager
{
    if (_manager) {
        return  _manager;
    }
    _manager = [AFHTTPSessionManager manager];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    return _manager;
}
@end
