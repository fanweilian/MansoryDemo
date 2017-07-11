//
//  BaseUseViewController.m
//  MasoryDemo
//
//  Created by fanweilian on 2017/7/6.
//  Copyright © 2017年 fanweilian. All rights reserved.
//

#import "BaseUseViewController.h"

@interface BaseUseViewController ()

@end

@implementation BaseUseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *leftView = [[UIView alloc] init];
    leftView.backgroundColor = [UIColor redColor];
    [self.view addSubview:leftView];
    
    UIView *rightView = [[UIView alloc] init];
    rightView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:rightView];
    
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:bottomView];
    
    CGFloat space = 64 + 5.0;
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(5);
        make.top.equalTo(self.view).offset(space);
        make.right.equalTo(rightView.mas_left).with.offset(-5);
        make.height.mas_equalTo(@200);
        make.width.equalTo(rightView.mas_width);
        
    }];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.mas_equalTo(leftView.mas_top);
        make.right.equalTo(self.view).offset(-5);
        make.height.mas_equalTo(leftView.mas_height);

    }];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(leftView.mas_bottom).offset(5);
        make.left.equalTo(self.view).offset(5);
        make.right.equalTo(self.view).offset(-5);
        make.bottom.equalTo(self.view).offset(-5);
        
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
