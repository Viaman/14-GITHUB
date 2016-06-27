//
//  LinkViewController.m
//  文明嘉兴
//
//  Created by dc004 on 16/6/24.
//
//

#import "LinkViewController.h"
#import "LinkCollectionViewCell.h"
@interface LinkViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collView;

@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)NSArray *engTitleArray;
@end

@implementation LinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleArray =@[@"嘉兴在线",@"嘉兴文明网",@"浙江文明网",@"浙江在线",@"中国社区网",@"中华未成年人网",@"红船网",@"南湖文明网",@"秀洲文明网",@"星期六义务劳动联盟",@"桐乡文明网",@"海宁文明网",@"嘉兴国防教育网",@"嘉兴群众路线网",@"南湖青少年网"];
    self.engTitleArray=@[@"Jia xing zai xian",@"jia xing wen ming wang",@"zhe jiang wen ming wang",@"Zhe jiang zai xian",@"Zhong guo she qu wang",@"Zhonghua wei cheng nian ren wang",@"Hong chuan wang",@"Nanhu wan ming wang",@"Xiuzhou wen ming wang",@"Xing qi liu yi wu lao dong",@"Tongxiang wenmingwang",@"Haining wenmingwang",@"Jiaxing guofang jiaoyuwang",@"Jiaxing qunzhong luxianwang",@"Nanhu qingshaonian wang"];
    [self.collView registerClass:[LinkCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.view.backgroundColor = [UIColor whiteColor];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.titleArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LinkCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.title.text = self.titleArray[indexPath.row];
    cell.engTitle.text = self.engTitleArray[indexPath.row];
    cell.num.text = [NSString stringWithFormat:@"%02ld",indexPath.row+1];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSUserDefaults *user= [NSUserDefaults standardUserDefaults];
    [user setValue:[NSString stringWithFormat:@"%li",indexPath.row] forKey:@"value"];
    [self performSegueWithIdentifier:@"xian" sender:nil];
    
}

@end
