//
//  LinkCollectionViewCell.m
//  NewsWork-张敏
//
//  Created by dc009 on 16/6/22.
//  Copyright © 2016年 via.man. All rights reserved.
//

#import "LinkCollectionViewCell.h"

@implementation LinkCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"LinkCollectionViewCell" owner:self options:nil]lastObject];
    }
    return self;
}
@end
