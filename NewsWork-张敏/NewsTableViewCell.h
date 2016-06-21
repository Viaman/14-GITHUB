//
//  NewsTableViewCell.h
//  NewsWork-张敏
//
//  Created by dc009 on 16/6/4.
//  Copyright © 2016年 via.man. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *newsImage;
@property (weak, nonatomic) IBOutlet UILabel *newsTitle;
@property (weak, nonatomic) IBOutlet UILabel *newsTime;
@property (weak, nonatomic) IBOutlet UILabel *newsLaud;
@property (weak, nonatomic) IBOutlet UILabel *newsComment;

@end
