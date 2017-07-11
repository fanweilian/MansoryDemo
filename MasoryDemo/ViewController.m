//
//  ViewController.m
//  MasoryDemo
//
//  Created by fanweilian on 2017/7/6.
//  Copyright © 2017年 fanweilian. All rights reserved.
//

#import "ViewController.h"
#import "BaseUseViewController.h"
#import "UpdateContraintViewController.h"
#import "RemarkContraintViewController.h"
#import "TotoalUpdateViewController.h"
#import "CompositViewController.h"
#import "ScrollViewController.h"
#import "ComplexScrollViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *controllers;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.controllers = @[[[BaseUseViewController alloc] initWithTitle:@"基本使用"],
                         [[UpdateContraintViewController alloc] initWithTitle:@"更新约束"],
                         [[RemarkContraintViewController alloc] initWithTitle:@"重新添加约束"],
                         [[TotoalUpdateViewController alloc] initWithTitle:@"整体更新约束"],
                         [[CompositViewController alloc] initWithTitle:@"复合View约束"],
                         [[ScrollViewController alloc] initWithTitle:@"scrollView布局"],
                         [[ComplexScrollViewController alloc] initWithTitle:@"复杂scrollView布局"]
                         ];
    // Do any additional setup after loading the view, typically from a nib.
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellIdentifier = @"CellIdentifier";
    UIViewController *viewController = self.controllers[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
    }
    
    cell.textLabel.text = viewController.title;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.controllers.count;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController = self.controllers[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
