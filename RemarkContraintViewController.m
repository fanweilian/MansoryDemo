//
//  RemarkContraintViewController.m
//  MasoryDemo
//
//  Created by fanweilian on 2017/7/6.
//  Copyright © 2017年 fanweilian. All rights reserved.
//

#import "RemarkContraintViewController.h"

@interface RemarkContraintViewController ()
@property (nonatomic, strong) UIButton *growingButton;
@property (nonatomic, assign) BOOL isExpanded;
@end

@implementation RemarkContraintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.growingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.growingButton setTitle:@"点我展开" forState:UIControlStateNormal];
    self.growingButton.layer.borderColor = UIColor.greenColor.CGColor;
    self.growingButton.layer.borderWidth = 3;
    self.growingButton.backgroundColor = [UIColor redColor];
    [self.growingButton addTarget:self action:@selector(onGrowButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.growingButton];
    self.isExpanded = NO;
    
    [self.growingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(self.view).offset(-500 + 400*self.isExpanded);
        
    }];

    // Do any additional setup after loading the view.
}

- (void)onGrowButtonTaped:(UIButton *)btn{

    self.isExpanded = ! self.isExpanded;
    if (self.isExpanded) {
        [self.growingButton setTitle:@"点击收缩" forState:UIControlStateNormal];
    }else{
        
        [self.growingButton setTitle:@"点击展开" forState:UIControlStateNormal];
    }

    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.2 animations:^{
       
        [self.view layoutIfNeeded];
    }];
}

- (void)updateViewConstraints{

    [self.growingButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(self.view).offset(-500 + 400*self.isExpanded);
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
