//
//  NotifyTableViewCell.h
//  文明嘉兴
//
//  Created by dc004 on 16/6/24.
//
//

#import <UIKit/UIKit.h>

@interface NotifyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *date;
@end
