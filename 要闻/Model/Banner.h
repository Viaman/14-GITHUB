//
//  Banner.h
//  文明嘉兴
//
//  Created by dc004 on 16/6/24.
//
//
#import <Foundation/Foundation.h>

@interface Banner : NSObject
@property (nonatomic,strong) AFHTTPSessionManager * manager;

@property(nonatomic,strong)NSString *flashId;
@property(nonatomic,strong)NSString *imageurl;
@property(nonatomic,strong)NSString *link;
@property(nonatomic,strong)NSString *title;


+(void)getImageDataBanner:(int)page;
@end
