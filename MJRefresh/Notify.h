//
//  Notify.h
//  NewsWork-张敏
//
//  Created by dc009 on 16/6/23.
//  Copyright © 2016年 via.man. All rights reserved.
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
