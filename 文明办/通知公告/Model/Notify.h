//
//  Notify.h
//  文明嘉兴
//
//  Created by dc004 on 16/6/24.
//
//

#import <Foundation/Foundation.h>

@interface Notify : NSObject
@property (nonatomic,strong) AFHTTPSessionManager * manager;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *imageurl;
@property(nonatomic,strong)NSString *content;
@property(nonatomic,strong)NSString *announcementId;


+ (void) getNotifyData;
@end
