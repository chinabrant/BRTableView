//
//  DemoCellViewModel.m
//  YTTableView_Example
//
//  Created by brant on 09/05/2018.
//  Copyright © 2018 sjwu1234@gmail.com. All rights reserved.
//

#import "DemoCellViewModel.h"

@implementation DemoCellViewModel

/**
 返回cell的高度, 这个方法是在view model中实现，view model中有cell的全部数据，所以这里可以通过数据计算高度，或者直接返回固定高度
 
 @return cell的高度
 */
- (CGFloat)cellHeight {
    return 50;
}


/**
 返回cell的复用id
 
 @return cell的复用id
 */
+ (NSString *)identifier {
    return @"DemoCell";
}


/**
 注册cell
 
 @param table 要注册到的table view
 */
+ (void)registerFor:(UITableView *)table {
    [table registerNib:[UINib nibWithNibName:@"DemoCell" bundle:nil] forCellReuseIdentifier:[DemoCellViewModel identifier]];
}

@end
