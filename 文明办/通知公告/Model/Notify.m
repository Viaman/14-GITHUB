//
//  Notify.m
//  文明嘉兴
//
//  Created by dc004 on 16/6/24.
//
//

#import "Notify.h"

@implementation Notify
+ (void) getNotifyData
{
    [[[self class] alloc]getNotifyWithPageNum];
}
-(void)getNotifyWithPageNum
  {
    NSDictionary *dict = @{
                           @"pageNum":@1,
                           };
    [self.manager POST:@"http://jxwm.gkmm.net:8989/news/announ/getAnnouncement.do" parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject[@"result"]isEqualToNumber:@0]) {
            
            
            NSMutableArray * notiyData = [Notify mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
            [[NSNotificationCenter defaultCenter] postNotificationName:GetNotifyDataNotification object:notiyData];
        }else{
            NSLog(@"请求错误:%@",responseObject[@"message"]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
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
