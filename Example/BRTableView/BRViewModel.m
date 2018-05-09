//
//  YTViewModel.m
//  YTTableView_Example
//
//  Created by brant on 09/05/2018.
//  Copyright © 2018 sjwu1234@gmail.com. All rights reserved.
//

#import "BRViewModel.h"
#import "DemoCellViewModel.h"
#import <BRTableView/BRTableViewSection.h>

@implementation BRViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        DemoCellViewModel *cell1 = [DemoCellViewModel new];
        cell1.title = @"亚索";
        
        DemoCellViewModel *cell2 = [DemoCellViewModel new];
        cell2.title = @"小法师";
        
        DemoCellViewModel *cell3 = [DemoCellViewModel new];
        cell3.title = @"Flutter";
        
        BRTableViewSection *section1 = [[BRTableViewSection alloc] initWithSectionKey:@"" viewModels:@[cell1, cell2, cell3]];
        self.sections = @[section1];
    }
    return self;
}

@end
