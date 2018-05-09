//
//  YTTableViewSection.m
//  TableViewDemo
//
//  Created by brant on 2017/12/7.
//  Copyright © 2017年 Brant. All rights reserved.
//

#import "BRTableViewSection.h"


@implementation BRTableViewSection

- (instancetype)initWithSectionKey:(NSString *)key viewModels:(NSArray *)viewModels {
    self = [super init];
    if (self) {
        _sectionKey = key;
        _viewModels = viewModels;
        _numberOfRows = viewModels.count;
        
        _autoSeparator = NO;
        _separatorLeftInset = 0;
        _separatorRightInset = 0;
        _separatorColor = [UIColor colorWithRed:0xe6/255.0 green:0xe6/255.0 blue:0xe6/255.0 alpha:1];
        _separatorHeight = 0.5;
        
        _sectionTopSeparator = NO;
        _topSeparatorHeight = 0.5;
        _topSeparatorColor = [UIColor colorWithRed:0xe6/255.0 green:0xe6/255.0 blue:0xe6/255.0 alpha:1];
        
        _sectionBottomSeparator = NO;
        _bottomSeparatorHeight = 0.5;
        _bottomSeparatorColor = [UIColor colorWithRed:0xe6/255.0 green:0xe6/255.0 blue:0xe6/255.0 alpha:1];
    }
    
    return self;
}

- (void)setViewModels:(NSArray *)viewModels {
    _viewModels = viewModels;
    
    _numberOfRows = viewModels.count;
}

@end
