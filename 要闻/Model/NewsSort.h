//
//  NewsSort.h
//  文明嘉兴
//
//  Created by dc004 on 16/6/24.
//
//

#import <Foundation/Foundation.h>

@interface NewsSort : NSObject
@property(nonatomic ,strong)NSNumber * categoryId;
@property(nonatomic, strong)NSString * categoryName;
@property(nonatomic ,strong)NSNumber * publishNum;
@property (nonatomic,strong) AFHTTPSessionManager * manager;

+(void)getNewsSort;

@end
