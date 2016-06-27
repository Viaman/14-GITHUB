//
//  LinkCollectionViewCell.m
//  文明嘉兴
//
//  Created by dc004 on 16/6/24.
//
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
