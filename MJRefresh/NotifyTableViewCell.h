//
//  NotifyTableViewCell.h
//  NewsWork-张敏
//
//  Created by dc009 on 16/6/23.
//  Copyright © 2016年 via.man. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotifyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *date;

@end
