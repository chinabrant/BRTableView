//
//  YTTableCellViewModelProtocol.h
//  TableViewDemo
//
//  Created by brant on 2017/12/7.
//  Copyright © 2017年 Brant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 UITableViewCell 对应的ViewModel 的协议
 */
@protocol BRTableCellViewModelProtocol <NSObject>

@required;
/**
 返回cell的高度, 这个方法是在view model中实现，view model中有cell的全部数据，所以这里可以通过数据计算高度，或者直接返回固定高度
 
 @return cell的高度
 */
- (CGFloat)cellHeight;


/**
 返回cell的复用id
 
 @return cell的复用id
 */
+ (NSString *)identifier;


/**
 注册cell

 @param table 要注册到的table view
 */
+ (void)registerFor:(UITableView *)table;

@end
