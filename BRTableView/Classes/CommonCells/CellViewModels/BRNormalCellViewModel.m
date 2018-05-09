//
//  YTNormalCellViewModel.m
//  Pods-YTUIKit_Example
//
//  Created by brant on 2017/12/11.
//

#import "BRNormalCellViewModel.h"
#import "BRNormalCell.h"

@implementation BRNormalCellViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _height = 44;
        
        _arrowImage = @"ytuikit_arrow";
        
        _leftEdge = 12;
        _leftTitle = @"标题";
        _leftTitleFont = [UIFont systemFontOfSize:14];
        _leftTitleColor = [UIColor colorWithRed:0x66/255.0 green:0x66/255.0 blue:0x66/255.0 alpha:1];
        
        _rightEdge = 12;
        _rightTitle = @"描述";
        _rightTitleFont = [UIFont systemFontOfSize:14];
        _rightTitleColor = [UIColor colorWithRed:0x66/255.0 green:0x66/255.0 blue:0x66/255.0 alpha:1];
        
        _rightTitleAndArrowGap = 8.0;
        
        _isShowArrow = YES;
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
    return @"BRNormalCell";
}


/**
 注册cell
 
 @param table 要注册到的table view
 */
+ (void)registerFor:(UITableView *)table {
    [table registerClass:[BRNormalCell class] forCellReuseIdentifier:[BRNormalCellViewModel identifier]];
}

@end
