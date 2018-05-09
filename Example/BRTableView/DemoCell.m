//
//  DemoCell.m
//  YTTableView_Example
//
//  Created by brant on 09/05/2018.
//  Copyright © 2018 sjwu1234@gmail.com. All rights reserved.
//

#import "DemoCell.h"
#import "DemoCellViewModel.h"

@interface DemoCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation DemoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configCellWithViewModel:(id)viewModel {
    DemoCellViewModel *vm = viewModel;
    
    self.titleLabel.text = vm.title;
}

@end
