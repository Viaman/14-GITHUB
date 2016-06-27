//
//  NewsTableViewCell.h
//  文明嘉兴
//
//  Created by dc004 on 16/6/24.
//
//

#import <UIKit/UIKit.h>

@interface NewsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *newsImage;
@property (weak, nonatomic) IBOutlet UILabel *newsTitle;
@property (weak, nonatomic) IBOutlet UILabel *newsTime;
@property (weak, nonatomic) IBOutlet UILabel *newsLaud;
@property (weak, nonatomic) IBOutlet UILabel *newsComment;

@end
