//
//  Banner.m
//  NewsWork-张敏
//
//  Created by dc009 on 16/6/8.
//  Copyright © 2016年 via.man. All rights reserved.
//

#import "Banner.h"

@implementation Banner
+(void)getImageDataBanner{
[[[self class]alloc]getImageData];
}
-(void)getImageData
{
    NSDictionary *dict = @{
                           @"categoryId":@1
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
