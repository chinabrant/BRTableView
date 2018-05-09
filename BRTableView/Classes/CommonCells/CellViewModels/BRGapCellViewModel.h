//
//  YTGapCellViewModel.h
//  TableViewDemo
//
//  Created by brant on 2017/12/7.
//  Copyright © 2017年 Brant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BRTableCellViewModelProtocol.h"


/**
 分隔线YTGapCell的view model
 */
@interface BRGapCellViewModel : NSObject <BRTableCellViewModelProtocol>

// 分隔线的高度,
@property (nonatomic) CGFloat height;
// 分隔线的背景色，占满屏幕宽度的 默认:白色
@property (nonatomic, strong) UIColor *backgroundColor;
// 分隔线的颜色 默认 #e6e6e6
@property (nonatomic, strong) UIColor *lineColor;
// 左边的缩进 default: 0
@property (nonatomic) CGFloat leftInset;
// 右边的缩进 default: 0
@property (nonatomic) CGFloat rightInset;

@end
