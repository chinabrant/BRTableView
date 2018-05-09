//
//  BRTableView.h
//  TableViewDemo
//
//  Created by brant on 2017/12/7.
//  Copyright © 2017年 Brant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BRTableViewSection.h"
#import "BRCellProtocol.h"
#import "BRTableCellViewModelProtocol.h"

typedef void (^DidSelectRow) (id viewModel, NSString *sectionKey);

typedef UIView * (^ViewForSectionHeader) (NSString *sectionKey);
typedef CGFloat (^HeightForSectionHeader) (NSString *sectionKey);

typedef UIView * (^ViewForSectionFooter) (NSString *sectionKey);
typedef CGFloat (^HeightForSectionFooter) (NSString *sectionKey);

typedef void (^CellCommitEditingStyleBlock) (UITableView *table, UITableViewCellEditingStyle style, NSIndexPath *ip, id viewModel);
typedef UITableViewCellEditingStyle (^CellEditingStyleForRowBlock) (UITableView *table, NSIndexPath *ip, id viewModel);
typedef NSString * (^CellTitleForDeleteButton) (UITableView *table, NSIndexPath *ip, id viewModel);
typedef NSArray<NSString *> * (^CellSectionIndexTitlesBlock) (UITableView *table);
typedef void (^CellScrollViewBlock) (UIScrollView *sv);
typedef void (^CellScrollViewWillEndDragging) (UIScrollView *sv, CGPoint velocity, CGPoint *targetContentOffset);
typedef NSInteger (^CellNumberOfSectionBlock) (UITableView *tableView);


/*
 用init方法初始化，不用设置DataSource 和Delegate
 */
@interface BRTableView : UITableView

/*
 设置sections的时候会自动刷新table view
 */
@property (nonatomic, copy) NSArray *sections;

@property (nonatomic, copy) DidSelectRow didSelectRow;  // 点击了cell


/**
 section header view  主要为了保留系统table view的 header 悬停
 */
@property (nonatomic, copy) ViewForSectionHeader viewForSectionHeader;
@property (nonatomic, copy) HeightForSectionHeader heightForSectionHeader;


/**
 section footer view
 */
@property (nonatomic, copy) ViewForSectionFooter viewForSectionFooter;
@property (nonatomic, copy) HeightForSectionFooter heightForSectionFooter;


@property (nonatomic, copy) CellNumberOfSectionBlock numberOfSection;
@property (nonatomic, copy) CellCommitEditingStyleBlock commitEditingStyle;
@property (nonatomic, copy) CellEditingStyleForRowBlock editingStyleForRow;
@property (nonatomic, copy) CellTitleForDeleteButton titleForDeleteButton;
@property (nonatomic, copy) CellSectionIndexTitlesBlock sectionIndexTitles;
@property (nonatomic, copy) CellScrollViewBlock scrollViewDidScroll;
@property (nonatomic, copy) CellScrollViewBlock scrollViewWillBeginDragging;
@property (nonatomic, copy) CellScrollViewWillEndDragging scrollViewWillEndDragging;

@end
