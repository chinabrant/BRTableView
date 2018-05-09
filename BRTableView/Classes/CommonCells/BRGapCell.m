//
//  YTGapCell.m
//  TableViewDemo
//
//  Created by brant on 2017/12/7.
//  Copyright © 2017年 Brant. All rights reserved.
//

#import "BRGapCell.h"
#import "BRGapCellViewModel.h"

@interface BRGapCell ()

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) BRGapCellViewModel *viewModel;

@end

@implementation BRGapCell

+ (void)registerFor:(UITableView *)table {
    [table registerClass:[BRGapCell class] forCellReuseIdentifier:[BRGapCellViewModel identifier]];
}

- (void)configCellWithViewModel:(id)viewModel {
    BRGapCellViewModel *vm = viewModel;
    
    self.viewModel = viewModel;
    
    if (vm.backgroundColor) {
        
        self.contentView.backgroundColor = vm.backgroundColor;
        self.lineView.backgroundColor = vm.lineColor;
    }
    
    self.lineView.frame = CGRectMake(self.viewModel.leftInset,
                                     0,
                                     self.contentView.frame.size.width - self.viewModel.leftInset - self.viewModel.rightInset,
                                     self.viewModel.height);
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.lineView.frame = CGRectMake(self.viewModel.leftInset,
                                     0,
                                     self.contentView.frame.size.width - self.viewModel.leftInset - self.viewModel.rightInset,
                                     self.viewModel.height);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 去除点击效果
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.lineView];
        
    }
    
    return self;
}

#pragma mark - lazy load

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
    }
    
    return _lineView;
}

@end
