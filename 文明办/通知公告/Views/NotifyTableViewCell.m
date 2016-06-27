//
//  NotifyTableViewCell.m
//  文明嘉兴
//
//  Created by dc004 on 16/6/24.
//
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
