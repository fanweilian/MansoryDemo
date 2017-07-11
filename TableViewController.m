//
//  TableViewController.m
//  MasoryDemo
//
//  Created by fanweilian on 2017/7/11.
//  Copyright © 2017年 fanweilian. All rights reserved.
//

#import "TableViewController.h"
#import "TestCell.h"

@interface TableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    for (NSUInteger i = 0; i < 10; ++i) {
        TestModel *model = [[TestModel alloc] init];
        model.title = @"测试标题，可能很长很长，反正随便写着先吧！";
        model.desc = @"描述内容通常都是很长很长的，描述内容通常都是很长很长的，描述内容通常都是很长很长的，描述内容通常都是很长很长的，描述内容通常都是很长很长的，描述内容通常都是很长很长的，描述内容通常都是很长很长的，描述内容通常都是很长很长的，描述内容通常都是很长很长的，描述内容通常都是很长很长的，描述内容通常都是很长很长的，";
        
        [self.dataSource addObject:model];
    }
    
    [self.tableView reloadData];
}

- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    
    return _dataSource;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CellIdentifier";
    
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[TestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.indexPath = indexPath;
    cell.block = ^(NSIndexPath *path) {
        [tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
    };
    TestModel *model = [self.dataSource objectAtIndex:indexPath.row];
    [cell configCellWithModel:model];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestModel *model = [self.dataSource objectAtIndex:indexPath.row];
    
    return [TestCell heightWithModel:model];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
