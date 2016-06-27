//
//  News.h
//  文明嘉兴
//
//  Created by dc004 on 16/6/24.
//
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

@property (nonatomic,strong) NSString * titleNews;
@property (nonatomic,strong) NSString * categoryFk;
@property (nonatomic,strong) NSString * content;
@property (nonatomic,strong) NSString * link;


+ (void) getNewsDataWithPageNum:(int)pageNum andCategoryPage:(int)page;

@end
