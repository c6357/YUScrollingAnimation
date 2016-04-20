//
//  ViewController.m
//  https://github.com/c6357/YUScrollingAnimation
//
//  Created by BruceYu on 16/4/6.
//  Copyright © 2016年 BruceYu. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "AnimationTableViewCell.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    @weakify(self);
    [self.tableView config:^(UITableView *tableView) {
        @strongify(self);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.backgroundColor = [UIColor blackColor];
        [AnimationTableViewCell registerForTable:tableView];
    }];
    [self.view addSubview:self.tableView];
}

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return APP_Screen_Height()/3.f;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2016;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnimationTableViewCell *cell = [AnimationTableViewCell XIBCellFor:tableView];
    [cell updateData:nil indexPath:indexPath];
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.tableView yuScrollViewDidScroll:scrollView Animation:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
