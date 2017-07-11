//
//  ComplexScrollViewController.m
//  MasoryDemo
//
//  Created by fanweilian on 2017/7/10.
//  Copyright © 2017年 fanweilian. All rights reserved.
//

#import "ComplexScrollViewController.h"

@interface ComplexScrollViewController ()
@property (nonatomic,strong) NSMutableArray *labelArray;
@end

@implementation ComplexScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _labelArray = [NSMutableArray array];
    
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
        
        textLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
        [textLabel addGestureRecognizer:tap];
        

        [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(self.view).offset(-10);
            if (lastLabel) {
                make.top.equalTo(lastLabel.mas_bottom).offset(20);
            }else{
                make.top.equalTo(scroll).offset(20);
            }
            make.height.mas_equalTo(40);
            
        }];
        lastLabel = textLabel;
        [_labelArray addObject:[@[textLabel,@(NO)] mutableCopy]];
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
- (NSMutableArray *)labelArray{

    if (_labelArray == nil) {
        _labelArray = [[NSMutableArray alloc] init];
    }
    return _labelArray;
    
}
- (void)onTap:(UITapGestureRecognizer *)sender {
    UIView *tapView = sender.view;
    NSUInteger index = 0;
    for (NSMutableArray *array in _labelArray) {
        UILabel *currentView = [array firstObject];
        if (tapView == currentView) {
            NSNumber *state = [array lastObject];
            if ([state boolValue] == YES) { //当前是展开的，则收缩

                [tapView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(40);
                }];
            }else{
                UIView *preView = nil;
                UIView *nextView =nil;
                if (index-1 < _labelArray.count && index > 0) {
                    preView = [_labelArray[index -1] firstObject];
                }
                if (index+1 < _labelArray.count) {
                    
                    nextView = [_labelArray[index +1] firstObject];
                }
                
                [currentView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    if (preView) {
                        make.top.equalTo(preView.mas_bottom).offset(20);
                    }else{
                        make.top.mas_equalTo(20);
                    }
                    make.left.mas_equalTo(10);
                    make.right.mas_equalTo(-10);
                    
                }];
                if (nextView) {
                    [nextView mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.top.mas_equalTo(currentView.mas_bottom).offset(20);
                        
                    }];
                }
               
            
            }
             [array replaceObjectAtIndex:1 withObject:@(!state.boolValue)];
            [self.view setNeedsUpdateConstraints];
            [self.view updateConstraintsIfNeeded];
            [UIView animateWithDuration:0.2 animations:^{
               
                [self.view layoutIfNeeded];
            }];
            
            break;
            
        }
        
        index ++;
        
    }

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
