//
//  CompositViewController.m
//  MasoryDemo
//
//  Created by fanweilian on 2017/7/6.
//  Copyright © 2017年 fanweilian. All rights reserved.
//

#import "CompositViewController.h"

@interface CompositViewController ()
@property (nonatomic, strong) NSMutableArray *viewArray;
@property (nonatomic, assign) BOOL isNormal;
@end

@implementation CompositViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *lastView = self.view;
    for (int i = 0; i < 6; i++) {
        UIView *view = UIView.new;
        view.backgroundColor = [self randomColor];
        view.layer.borderColor = UIColor.blackColor.CGColor;
        view.layer.borderWidth = 2;
        [self.view addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(lastView).insets(UIEdgeInsetsMake(20, 20, 20, 20));
        }];
        
        lastView = view;
        
        [self.viewArray addObject:view];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(onTap)];
        [view addGestureRecognizer:tap];
    }
    self.isNormal = YES;

    // Do any additional setup after loading the view.
}
- (void)onTap{
     UIView *lastView = self.view;
    if (self.isNormal) {
            for (NSInteger i= _viewArray.count -1; i>0; i--) {
            UIView *itemView = _viewArray[i];
            [itemView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(lastView).insets(UIEdgeInsetsMake(20, 20, 20, 20));
                
            }];
            [self.view bringSubviewToFront:itemView];
            lastView = itemView;
        }
    }else{
    
       
        for (NSInteger i=0; i< _viewArray.count-1; i++) {
            UIView *itemView = _viewArray[i];
            [itemView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(lastView).insets(UIEdgeInsetsMake(20, 20, 20, 20));
            }];
            [self.view bringSubviewToFront:itemView];
            lastView = itemView;
        }
    }
    
    [self.view updateConstraints];
    [self.view updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.5 animations:^{
       
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.isNormal = ! self.isNormal;
    }];
    
    
    
}
- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
- (NSMutableArray *)viewArray {
    if (_viewArray == nil) {
        _viewArray = [[NSMutableArray alloc] init];
    }
    
    return _viewArray;
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
