//
//  TestCell.h
//  MasoryDemo
//
//  Created by fanweilian on 2017/7/11.
//  Copyright © 2017年 fanweilian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, assign) BOOL isExpanded;

@end

typedef void (^TestBlock)(NSIndexPath *indexPath);

@interface TestCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, copy) TestBlock block;

- (void)configCellWithModel:(TestModel *)model;

+ (CGFloat)heightWithModel:(TestModel *)model;

@end
