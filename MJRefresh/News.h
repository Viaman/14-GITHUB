//
//  News.h
//  NewsWork-张敏
//
//  Created by dc009 on 16/6/8.
//  Copyright © 2016年 via.man. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property (nonatomic,strong) AFHTTPSessionManager * manager;



@property(nonatomic,strong)NSString *newsId;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *summary;
@property(nonatomic,strong)NSString *source;
@property(nonatomic,strong)NSString *image;
@property(nonatomic,strong)NSString *isBanner;
@property(nonatomic,strong)NSNumber *praiseNum;
@property(nonatomic,strong)NSNumber *browseNum;
@property(nonatomic,strong)NSString *issuestime;

+ (void) getNewsDataWithPageNum:(int)pageNum;
@end
