//
//  DemoCellViewModel.h
//  YTTableView_Example
//
//  Created by brant on 09/05/2018.
//  Copyright © 2018 sjwu1234@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BRTableView/BRTableCellViewModelProtocol.h>

@interface DemoCellViewModel : NSObject <BRTableCellViewModelProtocol>

@property (nonatomic, copy) NSString *title;

@end
