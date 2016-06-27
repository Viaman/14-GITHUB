//
//  ThemeTableViewCell.m
//  文明嘉兴
//
//  Created by dc004 on 16/6/24.
//
//

#import "ThemeTableViewCell.h"

@implementation ThemeTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self=[[[NSBundle mainBundle]loadNibNamed:@"ThemeTableViewCell" owner:self options:nil] lastObject];
    }
    return self;
}

@end
