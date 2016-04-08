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
//     LogPoint(self.tableView.contentOffset);
    NSArray *cellArry = [self.tableView visibleCells];
    UITableViewCell *cellFirst = [cellArry firstObject];
    UITableViewCell *cellLast  = [cellArry lastObject];
    
    for (UITableViewCell *cell in cellArry) {
        if (![cell isEqual:cellFirst] && ![cell isEqual:cellLast]) {
            CGRect frame = cell.contentView.frame;
            frame.origin.y = 0;
            cell.contentView.frame = frame;
        }
    }
    
    
    
    CGPoint point = [self.tableView convertPoint:[self.tableView rectForRowAtIndexPath:[self.tableView indexPathForCell:cellFirst]].origin toView:self.view];
    
    
    CGRect frame = cellFirst.contentView.frame;
    frame.origin.y = -point.y;
    cellFirst.contentView.frame = frame;
    [self.view sendSubviewToBack:cellFirst];
    [cellFirst layoutIfNeeded];
    
    
    frame = cellLast.contentView.frame;
    frame.origin.y = - frame.size.height - point.y;
    cellLast.contentView.frame = frame;
//    [self.tableView sendSubviewToBack:cellLast];
    
    
//    [self.tableView bringSubviewToFront:cellLast];
    
    LogPoint(point);
    
//    LogPoint(cell.frame.origin);
    
//    NSLog(@"cellArry %@",cellArry);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
