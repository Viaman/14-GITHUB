//
//  News.m
//  NewsWork-张敏
//
//  Created by dc009 on 16/6/8.
//  Copyright © 2016年 via.man. All rights reserved.
//

#import "News.h"

@implementation News

+ (void) getNewsDataWithPageNum:(int)pageNum
{
    [[[self class] alloc]getDataWithPageNum:pageNum];
}

#pragma mark 获取TableView的数据
-(void)getDataWithPageNum:(int)pageNum
{
    NSDictionary *dict = @{
                           @"categoryId":@1,
                           @"pageNum":@(pageNum)
                           };
    [self.manager POST:POST_getNewsByCategoryId parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject[@"result"]isEqualToNumber:@0]) {
                //1.获取到字典，然后转化成对象类型（模型），再存入数组
                NSArray *arrData = responseObject[@"data"];
                NSArray *resultNews = [News mj_objectArrayWithKeyValuesArray:arrData];
                //发送通知，已经加载到了数据
                [[NSNotificationCenter defaultCenter] postNotificationName:GetNewsDataNotification object:resultNews];
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
