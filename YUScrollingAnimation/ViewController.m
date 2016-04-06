//
//  ViewController.m
//  YUScrollingAnimation
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
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return APP_Screen_Height()/2.f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnimationTableViewCell *cell = [AnimationTableViewCell XIBCellFor:tableView];
    
    
    CGPoint point = [self.tableView convertPoint:[self.tableView rectForRowAtIndexPath:indexPath].origin toView:self.view];
    
   
//    LogPoint(point);
    
    return cell;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
     LogPoint(self.tableView.contentOffset);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
