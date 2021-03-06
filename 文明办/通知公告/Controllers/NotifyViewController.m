//
//  NotifyViewController.m
//  文明嘉兴
//
//  Created by dc004 on 16/6/24.
//
//

#import "NotifyViewController.h"
#import "NotifyTableViewCell.h"
#import "Notify.h"
@interface NotifyViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *notiyArray;
@end

@implementation NotifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[NotifyTableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.rowHeight = 150;
    
   [Notify getNotifyData];
    //添加通知，当获取到数据是进行提示
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(handleNotificationByNofity:)
     name:GetNotifyDataNotification
     object:nil];
    
    }
- (void) handleNotificationByNofity:(NSNotification *)notification
{
    self.notiyArray = [[NSArray alloc]init];
    self.notiyArray =notification.object;
    [self.tableView reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NotifyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    Notify *notify = self.notiyArray[indexPath.row];
    
    
    cell.title.text =notify.title;
    cell.content.text =notify.content;
    cell.date.text = @"2016-06-13-12-00";
    return cell;

}
@end
