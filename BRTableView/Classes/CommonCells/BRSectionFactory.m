//
//  SectionFactory.m
//  TableViewDemo
//
//  Created by brant on 2017/12/7.
//  Copyright © 2017年 Brant. All rights reserved.
//

#import "BRSectionFactory.h"
#import "BRGapCellViewModel.h"


@implementation BRSectionFactory

+ (BRTableViewSection *)gapSectionWithHeight:(CGFloat)hei backgroundColor:(UIColor *)color {
    BRGapCellViewModel *vm = [BRGapCellViewModel new];
    vm.height = hei;
    if (color) {
        vm.lineColor = color;
        vm.backgroundColor = color;
    }

    BRTableViewSection *section = [[BRTableViewSection alloc] initWithSectionKey:@"gap" viewModels:@[vm]];
    return section;
}

@end
