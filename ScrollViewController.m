//
//  ScrollViewController.m
//  MasoryDemo
//
//  Created by fanweilian on 2017/7/10.
//  Copyright © 2017年 fanweilian. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scroll = [[UIScrollView alloc] init];
    scroll.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:scroll];
    
    UILabel *lastLabel = nil;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    for ( int i=0; i< 20; i++) {
        UILabel *textLabel = [[UILabel alloc] init];
        textLabel.layer.borderColor = [UIColor redColor].CGColor;
        textLabel.layer.borderWidth = 2;
        textLabel.text = [self randomText];
        textLabel.numberOfLines = 0;
        
        textLabel.preferredMaxLayoutWidth = screenWidth - 20;
        textLabel.textAlignment = NSTextAlignmentLeft;
        textLabel.textColor = [self randomColor];
        [scroll addSubview: textLabel];
        
       
        [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(self.view).offset(-10);
            if (lastLabel) {
                 make.top.equalTo(lastLabel.mas_bottom).offset(20);
            }else{
                make.top.equalTo(scroll).offset(20);
            }
            
        }];
        lastLabel = textLabel;
        
    }
    
    [scroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
        make.bottom.equalTo(lastLabel.mas_bottom).offset(20);
        
    }];
    // Do any additional setup after loading the view.
}
- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (NSString *)randomText {
    CGFloat length = arc4random() % 50 + 5;
    
    NSMutableString *str = [[NSMutableString alloc] init];
    for (NSUInteger i = 0; i < length; ++i) {
        [str appendString:@"测试数据很长，"];
    }
    
    return str;
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
