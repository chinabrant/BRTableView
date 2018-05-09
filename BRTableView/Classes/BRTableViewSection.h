//
//  YTTableViewSection.h
//  TableViewDemo
//
//  Created by brant on 2017/12/7.
//  Copyright © 2017年 Brant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BRTableViewSection : NSObject

/**
 用来标识section的类型，要保证每个section的都不同
 代理方法里面如果要做特殊处理会用到，所以不能相同
 */
@property (nonatomic, copy) NSString *sectionKey;


/**
 section 里面 row 的 view model 集合
 */
@property (nonatomic, copy) NSArray *viewModels;


/**
 返回这个section有多少row，这个不用设置，在设置viewModels时，会自动设置
 */
@property (nonatomic, readonly) NSInteger numberOfRows;


/**
 是否自动添加分隔线
 */
@property (nonatomic) BOOL autoSeparator;
// 分隔线颜色 默认：#E6E6E6
@property (nonatomic, strong) UIColor *separatorColor;
@property (nonatomic, strong) UIColor *separatorBackgroundColor;
// 分隔线左边缩进
@property (nonatomic) CGFloat separatorLeftInset;
// 分隔线右边缩进
@property (nonatomic) CGFloat separatorRightInset;
// 分隔线的高度 默认1px
@property (nonatomic) CGFloat separatorHeight;

// section头部分隔线 不受separatorInset影响
@property (nonatomic) BOOL sectionTopSeparator;
@property (nonatomic) CGFloat topSeparatorHeight;
@property (nonatomic, strong) UIColor *topSeparatorColor;

// section尾部分隔线 不受separatorInset影响
@property (nonatomic) BOOL sectionBottomSeparator;
@property (nonatomic) CGFloat bottomSeparatorHeight;
@property (nonatomic, strong) UIColor *bottomSeparatorColor;

- (instancetype)initWithSectionKey:(NSString *)key viewModels:(NSArray *)viewModels;

@end
