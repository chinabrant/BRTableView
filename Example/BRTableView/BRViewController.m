//
//  BRViewController.m
//  BRTableView
//
//  Created by sjwu1234@gmail.com on 05/09/2018.
//  Copyright (c) 2018 sjwu1234@gmail.com. All rights reserved.
//

#import "BRViewController.h"
#import <BRTableView/BRTableView.h>
#import "BRViewModel.h"

@interface BRViewController ()

@property (nonatomic, strong) BRTableView *tableView;

@property (nonatomic, strong) BRViewModel *viewModel;

@end

@implementation BRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
    
    // 执行这句会自动reloadData
    self.tableView.sections = self.viewModel.sections;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BRTableView *)tableView {
    if (!_tableView) {
        _tableView = [[BRTableView alloc] init];
        _tableView.tableFooterView = [UIView new];
    }
    
    return _tableView;
}

- (BRViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [BRViewModel new];
    }
    
    return _viewModel;
}

@end
