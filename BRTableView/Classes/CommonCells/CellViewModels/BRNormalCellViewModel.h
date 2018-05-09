//
//  YTNormalCellViewModel.h
//  Pods-YTUIKit_Example
//
//  Created by brant on 2017/12/11.
//

#import <Foundation/Foundation.h>
#import "BRTableCellViewModelProtocol.h"

@interface BRNormalCellViewModel : NSObject <BRTableCellViewModelProtocol>

@property (nonatomic) CGFloat height;

// 左边间距 默认12
@property (nonatomic) CGFloat leftEdge;
@property (nonatomic, copy) NSString *leftTitle;
@property (nonatomic, strong) UIFont *leftTitleFont;
@property (nonatomic, strong) UIColor *leftTitleColor;

// 右边间距 默认12
@property (nonatomic) CGFloat rightEdge;
@property (nonatomic, copy) NSString *rightTitle;
@property (nonatomic, strong) UIFont *rightTitleFont;
@property (nonatomic, strong) UIColor *rightTitleColor;

// 右边标题和箭头的间隔
@property (nonatomic) CGFloat rightTitleAndArrowGap;

@property (nonatomic, copy) NSString *arrowImage;

@property (nonatomic) BOOL isShowArrow; // 是否要显示箭头

@end
