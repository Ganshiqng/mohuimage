//
//  ViewController.m
//  mohu
//
//  Created by 甘世清 on 2021/7/13.
//

#import "ViewController.h"
#import "UIImageView+LBBlurredImage.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView * tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [ self SQ_UIview];
}

-(void)SQ_UIview{
    
    
    [self.view addSubview:self.tableView];
    self.tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
 
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PrivilegeControlTableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PrivilegeControlTableViewCell"];
    }
    //    去掉点击效果
    
    UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 230)];
//    image.image = [UIImage imageNamed:@"1"];
    [image setImageToBlur:[UIImage imageNamed:@"1"] blurRadius:30 completionBlock:^{
        
    }];
    image.contentMode = UIViewContentModeScaleAspectFit;
    [cell addSubview:image];
    
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
#pragma mark - tableView的代理

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 242;
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
//        _tableView.estimatedRowHeight = 0;
//        _tableView.estimatedSectionFooterHeight = 0;
//        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.separatorStyle = NO;
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
      
    }
    return _tableView;
}


@end
