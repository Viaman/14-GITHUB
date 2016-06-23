//
//  NotifyTableViewCell.m
//  NewsWork-张敏
//
//  Created by dc009 on 16/6/23.
//  Copyright © 2016年 via.man. All rights reserved.
//

#import "NotifyTableViewCell.h"

@implementation NotifyTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"NotifyTableViewCell" owner:self options:nil]lastObject];
    }
    return self;
}

@end
