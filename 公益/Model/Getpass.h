//
//  Getpass.h
//  文明嘉兴
//
//  Created by dc004 on 16/6/24.
//
//

#import <Foundation/Foundation.h>

@interface Getpass : NSObject

@property(nonatomic,strong)AFHTTPSessionManager *manager;
@property(nonatomic,strong)NSString *imageurl;
@property(nonatomic,strong)NSNumber *commonwealId;
@property(nonatomic, strong)NSString * title;

+ (void)getPass;
@end
