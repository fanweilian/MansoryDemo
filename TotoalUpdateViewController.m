//
//  TotoalUpdateViewController.m
//  MasoryDemo
//
//  Created by fanweilian on 2017/7/6.
//  Copyright © 2017年 fanweilian. All rights reserved.
//

#import "TotoalUpdateViewController.h"

@interface TotoalUpdateViewController ()
@property (nonatomic, strong) UIView *purpleView;
@property (nonatomic, strong) UIView *orangeView;
@property (nonatomic, assign) BOOL isExpaned;
@end

@implementation TotoalUpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *purpleView = [[UIView alloc] init];
    purpleView.backgroundColor = UIColor.purpleColor;
    purpleView.layer.borderColor = UIColor.blackColor.CGColor;
    purpleView.layer.borderWidth = 2;
    [self.view addSubview:purpleView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)
                                   ];
    [purpleView addGestureRecognizer:tap];
    self.purpleView = purpleView;
    
    UIView *orangeView = UIView.new;
    orangeView.backgroundColor = UIColor.orangeColor;
    orangeView.layer.borderColor = UIColor.blackColor.CGColor;
    orangeView.layer.borderWidth = 2;
    [self.view addSubview:orangeView];
    self.orangeView = orangeView;
    
    // 这里，我们不使用updateViewConstraints方法，但是我们一样可以做到。
    // 不过苹果推荐在updateViewConstraints方法中更新或者添加约束的
    self.isExpaned = NO;
    [self.purpleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(@74);
        if (self.isExpaned) {
            make.height.mas_equalTo(500);
        }else{
        make.height.mas_equalTo(200);
        
        }
    }];
    [self.orangeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.purpleView);
        if (!self.isExpaned) {
            make.width.height.mas_equalTo(100 * 0.5).priorityLow();
        } else {
            make.width.height.mas_equalTo(100 * 3).priorityLow();
        }
        
        // 最大值为250
        make.width.height.lessThanOrEqualTo(@250);
        
        // 最小值为90
        make.width.height.greaterThanOrEqualTo(@90);
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.textColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"点击purple部分放大，orange部分最大值250，最小值90";
    [self.purpleView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
    }];

    // Do any additional setup after loading the view.
}
-(void)onTap{

    self.isExpaned = ! self.isExpaned;

    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.2 animations:^{
        
        [self.view layoutIfNeeded];
    }];

    
}
- (void)updateViewConstraints{

    [self.purpleView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(@74);
        if (self.isExpaned) {
            make.height.mas_equalTo(500);
        }else{
            make.height.mas_equalTo(200);
            
        }
    }];
    [self.orangeView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.purpleView);
//        if (self.isExpaned) {
//            make.height.width.mas_equalTo(200);
//        }else{
//            make.height.width.mas_equalTo(50);
//            
//        }
        if (!self.isExpaned) {
            make.width.height.mas_equalTo(100 * 0.5).priorityLow();
        } else {
            make.width.height.mas_equalTo(100 * 3).priorityLow();
        }
        
        // 最大值为250
        make.width.height.lessThanOrEqualTo(@250);
        
        // 最小值为90
        make.width.height.greaterThanOrEqualTo(@90);
    }];
    
    [super updateViewConstraints];

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
