//
//  NewsTableViewCell.m
//  文明嘉兴
//
//  Created by dc004 on 16/6/24.
//
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"NewsTableViewCell" owner:self options:nil] lastObject];
        //设置图片角为圆角
        self.newsImage.layer.cornerRadius = 10;
        //裁剪
        self.newsImage.clipsToBounds = YES;
    }
    return self;
}
@end
