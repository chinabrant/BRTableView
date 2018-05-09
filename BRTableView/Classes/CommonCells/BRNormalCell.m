//
//  YTNormalCell.m
//  Pods-YTUIKit_Example
//
//  Created by brant on 2017/12/11.
//

#import "BRNormalCell.h"
#import "BRNormalCellViewModel.h"

#define kYTUIKitSrcName(file) [@"YTUIKit.bundle" stringByAppendingPathComponent:file]
#define kYTUIKitFrameworkSrcName(file) [@"Frameworks/YTUIKit.framework/YTUIKit.bundle" stringByAppendingPathComponent:file]


@interface BRNormalCell ()

// 左标题
@property (nonatomic, strong) UILabel *leftTitleLabel;
// 右标题
@property (nonatomic, strong) UILabel *rightTitleLabel;
// 箭头
@property (nonatomic, strong) UIImageView *arrowImageView;

@property (nonatomic, strong) BRNormalCellViewModel *viewModel;

@end

@implementation BRNormalCell

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
        
        [self.contentView addSubview:self.leftTitleLabel];
        [self.contentView addSubview:self.rightTitleLabel];
        [self.contentView addSubview:self.arrowImageView];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.leftTitleLabel.center = CGPointMake(self.leftTitleLabel.frame.size.width / 2.0 + self.viewModel.leftEdge,
                                             self.contentView.frame.size.height / 2.0);
    
    if (self.viewModel.isShowArrow) {
        self.arrowImageView.center = CGPointMake(self.contentView.frame.size.width - self.viewModel.rightEdge - self.arrowImageView.frame.size.width / 2.0,
                                             self.contentView.frame.size.height / 2.0);
    }
    
    self.rightTitleLabel.center = CGPointMake(self.contentView.frame.size.width - self.viewModel.rightEdge - (self.viewModel.isShowArrow ? (self.arrowImageView.frame.size.width + self.viewModel.rightTitleAndArrowGap) : 0) - self.rightTitleLabel.frame.size.width / 2.0, self.contentView.frame.size.height / 2.0);
    
}

- (void)configCellWithViewModel:(id)viewModel {
    
    BRNormalCellViewModel *vm = viewModel;
    _viewModel = vm;
    
    self.leftTitleLabel.text = vm.leftTitle;
    self.leftTitleLabel.font = vm.leftTitleFont;
    self.leftTitleLabel.textColor = vm.leftTitleColor;
    
    self.rightTitleLabel.textColor = vm.rightTitleColor;
    self.rightTitleLabel.font = vm.rightTitleFont;
    self.rightTitleLabel.text = vm.rightTitle;
    
    self.arrowImageView.image = [self getImage:vm.arrowImage];
    
    [self.leftTitleLabel sizeToFit];
    [self.rightTitleLabel sizeToFit];
    [self.arrowImageView sizeToFit];
    
    self.arrowImageView.hidden = !vm.isShowArrow;
    
    [self setNeedsLayout];
}

- (UIImage *)getImage:(NSString *)name {
    UIImage *image = [UIImage imageNamed:kYTUIKitSrcName(name) ? kYTUIKitSrcName(name) : kYTUIKitFrameworkSrcName(name)];
    if (!image) {
        image = [UIImage imageNamed:name];
    }
    
    return image;
}

- (UILabel *)leftTitleLabel {
    if (!_leftTitleLabel) {
        _leftTitleLabel = [UILabel new];
        _leftTitleLabel.font = [UIFont systemFontOfSize:14];
        
    }
    
    return _leftTitleLabel;
}

- (UILabel *)rightTitleLabel {
    if (!_rightTitleLabel) {
        _rightTitleLabel = [UILabel new];
        _rightTitleLabel.textAlignment = NSTextAlignmentRight;
    }
    
    return _rightTitleLabel;
}

- (UIImageView *)arrowImageView {
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] init];
        _arrowImageView.image = [UIImage imageNamed:@"ytuikit_arrow"];
        _arrowImageView.hidden = YES;
    }
    
    return _arrowImageView;
}




@end
