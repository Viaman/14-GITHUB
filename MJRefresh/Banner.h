//
//  Banner.h
//  NewsWork-张敏
//
//  Created by dc009 on 16/6/8.
//  Copyright © 2016年 via.man. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Banner : NSObject
@property (nonatomic,strong) AFHTTPSessionManager * manager;

@property(nonatomic,strong)NSString *flashId;
@property(nonatomic,strong)NSString *imageurl;
@property(nonatomic,strong)NSString *link;
@property(nonatomic,strong)NSString *title;


+(void)getImageDataBanner;
@end
