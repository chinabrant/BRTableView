//
//  BRTableView.m
//  TableViewDemo
//
//  Created by brant on 2017/12/7.
//  Copyright © 2017年 Brant. All rights reserved.
//

#import "BRTableView.h"
#import "BRCellProtocol.h"
#import "BRTableCellViewModelProtocol.h"
#import "BRTableViewSection.h"
#import "BRSectionFactory.h"
#import "BRGapCellViewModel.h"

@interface BRTableView () <UITableViewDataSource, UITableViewDelegate>


@end

@implementation BRTableView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.dataSource = self;
    self.delegate = self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

- (void)setSections:(NSArray *)sections {
    
    // 处理自动添加分隔线
    for (BRTableViewSection *section in sections) {
        
        if (section.viewModels.count <= 0) {
            continue;
        }
        
        NSMutableArray *vms = [NSMutableArray new];
        
        if (section.sectionTopSeparator) {
            // 插入一条顶部分隔线
            BRGapCellViewModel *gap = [BRGapCellViewModel new];
            gap.height = section.topSeparatorHeight;
            gap.lineColor = section.topSeparatorColor;
            [vms addObject:gap];
        }
        
        
        if (section.autoSeparator) {
            
            // 如果只有一个row，不用添加分隔线
            if (section.viewModels.count > 1) {
                
                for (int i = 0; i < section.viewModels.count; i++) {
                    
                    // 先把数据加进去
                    [vms addObject:section.viewModels[i]];
                    
                    if (i < section.viewModels.count - 1) {
                        
                        // 不是最后一条数据就插入一条分隔线
                        BRGapCellViewModel *gap = [BRGapCellViewModel new];
                        gap.height = section.separatorHeight;
                        gap.leftInset = section.separatorLeftInset;
                        gap.rightInset = section.separatorRightInset;
                        gap.backgroundColor = section.separatorBackgroundColor;
                        gap.lineColor = section.separatorColor;
                        [vms addObject:gap];
                    }
                }
            }
            else if (section.viewModels.count == 1) {
                [vms addObjectsFromArray:section.viewModels];
            }
        }
        else {
            [vms addObjectsFromArray:section.viewModels];
        }
        
        if (section.sectionBottomSeparator) {
            // 插入一条底部分隔线
            BRGapCellViewModel *gap = [BRGapCellViewModel new];
            gap.height = section.bottomSeparatorHeight;
            gap.lineColor = section.bottomSeparatorColor;
            [vms addObject:gap];
        }
        
        section.viewModels = [vms copy];
    }
    
    _sections = sections;
    
    [self reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    BRTableViewSection *sectionModel = self.sections[section];
    return sectionModel.numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BRTableViewSection *sectionModel = self.sections[indexPath.section];
    id <BRTableCellViewModelProtocol> vm = sectionModel.viewModels[indexPath.row];
    
    // 这里会反复注册，看能否有更好的写法。或者在设置sections的时候统一注册？
    [[vm class] registerFor:tableView];
    
    UITableViewCell<BRCellProtocol> *cell = [tableView dequeueReusableCellWithIdentifier:[[vm class] identifier]];
    
    if ([cell respondsToSelector:@selector(configCellWithViewModel:)]) {
        
        [cell configCellWithViewModel:vm];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BRTableViewSection *sectionModel = self.sections[indexPath.section];
    id <BRTableCellViewModelProtocol> vm = sectionModel.viewModels[indexPath.row];
    return [vm cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.didSelectRow) {
        BRTableViewSection *sectionModel = self.sections[indexPath.section];
        id vm = sectionModel.viewModels[indexPath.row];
        
        // 过滤掉分隔线的点击事件
        if ([vm isKindOfClass:[BRGapCellViewModel class]]) {
            return;
        }
        
        self.didSelectRow(sectionModel.viewModels[indexPath.row], sectionModel.sectionKey);
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    BRTableViewSection *sectionModel = self.sections[section];
    if (self.viewForSectionHeader) {
        return self.viewForSectionHeader(sectionModel.sectionKey);
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    BRTableViewSection *sectionModel = self.sections[section];
    if (self.heightForSectionHeader) {
        return self.heightForSectionHeader(sectionModel.sectionKey);
    }
    
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    BRTableViewSection *sectionModel = self.sections[section];
    if (self.viewForSectionFooter) {
        return self.viewForSectionFooter(sectionModel.sectionKey);
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    BRTableViewSection *sectionModel = self.sections[section];
    if (self.heightForSectionFooter) {
        return self.heightForSectionFooter(sectionModel.sectionKey);
    }
    
    return 0;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.commitEditingStyle) {
        BRTableViewSection *sectionModel = self.sections[indexPath.section];
        
        id vm = sectionModel.viewModels[indexPath.row];
        if ([vm isKindOfClass:[BRGapCellViewModel class]]) {
            return;
        }
        
        self.commitEditingStyle(tableView, editingStyle, indexPath, sectionModel.viewModels[indexPath.row]);
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.editingStyleForRow) {
        BRTableViewSection *sectionModel = self.sections[indexPath.section];
        
        id vm = sectionModel.viewModels[indexPath.row];
        if ([vm isKindOfClass:[BRGapCellViewModel class]]) {
            return UITableViewCellEditingStyleNone;
        }
        
        return self.editingStyleForRow(tableView, indexPath, sectionModel.viewModels[indexPath.row]);
    }
    
    return UITableViewCellEditingStyleNone;
}

- (NSString*)tableView:(UITableView*)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath*)indexPath NS_AVAILABLE_IOS(3_0) {
 
    if (self.titleForDeleteButton) {
        BRTableViewSection *sectionModel = self.sections[indexPath.section];
        
        return self.titleForDeleteButton(tableView, indexPath, sectionModel.viewModels[indexPath.row]);
    }
    
    return @"";
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.scrollViewDidScroll) {
        self.scrollViewDidScroll(scrollView);
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    if (self.scrollViewWillEndDragging) {
        self.scrollViewWillEndDragging(scrollView, velocity, targetContentOffset);
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (self.scrollViewWillBeginDragging) {
        self.scrollViewWillBeginDragging(scrollView);
    }
}

@end
