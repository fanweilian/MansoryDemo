//
//  UpdateContraintViewController.m
//  MasoryDemo
//
//  Created by fanweilian on 2017/7/6.
//  Copyright © 2017年 fanweilian. All rights reserved.
//

#import "UpdateContraintViewController.h"

@interface UpdateContraintViewController ()

@property(nonatomic,assign)  CGFloat scale;
@property (nonatomic,strong) UIButton *growBtn;
@end

@implementation UpdateContraintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"按钮1" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    btn1.layer.borderColor = UIColor.greenColor.CGColor;
    btn1.layer.borderWidth = 3;
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"按钮2" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    btn2.layer.borderColor = UIColor.greenColor.CGColor;
    btn2.layer.borderWidth = 3;
    [self.view addSubview:btn2];

    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 setTitle:@"按钮3" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    btn3.layer.borderColor = UIColor.greenColor.CGColor;
    btn3.layer.borderWidth = 3;
    [self.view addSubview:btn3];
//
    [@[btn1,btn2,btn3] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:30 leadSpacing:20 tailSpacing:20];
    
    [@[btn1,btn2,btn3] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(100);
        make.height.mas_equalTo(30);
        
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点我放大" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    btn.layer.borderColor = UIColor.greenColor.CGColor;
    btn.layer.borderWidth = 3;
    [self.view addSubview:btn];
    self.growBtn = btn;
    [btn addTarget:self action:@selector(growing:) forControlEvents:UIControlEventTouchUpInside];
    
    self.scale = 1.0;
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {

        make.center.equalTo(self.view);
        make.width.and.height.mas_equalTo(90*self.scale).priorityLow();
        make.width.height.lessThanOrEqualTo(self.view);
        
        
    }];
    
    // Do any additional setup after loading the view.
}

- (void)growing:(UIButton *)btn{
    self.scale += 0.2;
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);
        make.width.and.height.mas_equalTo(90*self.scale).priorityLow();
        make.width.height.lessThanOrEqualTo(self.view);
        
    }];
    
    // 告诉self.view约束需要更新
    [self.view setNeedsUpdateConstraints];
    // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
    [self.view updateConstraintsIfNeeded];

    
    [UIView animateWithDuration:0.2 animations:^{
       
        [self.view layoutIfNeeded];
    }];
    
}
- (void)updateViewConstraints{

    [self.growBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.and.height.mas_equalTo(90*self.scale).priorityLow();
        make.width.height.lessThanOrEqualTo(self.view);
        
    
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
