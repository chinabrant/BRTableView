//
//  YTGapCellViewModel.m
//  TableViewDemo
//
//  Created by brant on 2017/12/7.
//  Copyright © 2017年 Brant. All rights reserved.
//

#import "BRGapCellViewModel.h"
#import "BRGapCell.h"

@implementation BRGapCellViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _height = 6.0;
        _leftInset = 0;
        _rightInset = 0;
        _lineColor = [UIColor colorWithRed:0xe6/255.0 green:0xe6/255.0 blue:0xe6/255.0 alpha:1];
        _backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (CGFloat)cellHeight {
    return self.height;
}


/**
 返回cell的复用id
 
 @return cell的复用id
 */
+ (NSString *)identifier {
    return @"GapCell";
}

+ (void)registerFor:(UITableView *)table {
    [table registerClass:[BRGapCell class] forCellReuseIdentifier:[BRGapCellViewModel identifier]];
}

@end
