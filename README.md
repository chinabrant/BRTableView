# BRTableView

## 目的
解耦ViewController和UITableViewCell, 在cell类型很多时，更能显示出便捷。完全不需要在代理方法里面判断各种类型，返回对应的cell，返回对应的高度。cell的增加和删除也更好控制，只要改动一个地方，减小出错的概率。像个人中心、设置、电商app的首页等使用会非常方便维护。

## 使用

* 声明一个BRTableView
```
- (BRTableView *)tableView {
    if (!_tableView) {
        _tableView = [[BRTableView alloc] init];
        _tableView.tableFooterView = [UIView new];
    }

    return _tableView;
}
```
* 添加到view，并指明sections
```
[self.view addSubview:self.tableView];
self.tableView.frame = self.view.bounds;

// 执行这句会自动reloadData
self.tableView.sections = self.viewModel.sections;
```
* sections初始化如下
```
DemoCellViewModel *cell1 = [DemoCellViewModel new];
cell1.title = @"亚索";

DemoCellViewModel *cell2 = [DemoCellViewModel new];
cell2.title = @"小法师";

DemoCellViewModel *cell3 = [DemoCellViewModel new];
cell3.title = @"Flutter";

BRTableViewSection *section1 = [[BRTableViewSection alloc] initWithSectionKey:@"" viewModels:@[cell1, cell2, cell3]];
self.sections = @[section1];
```

上面的例子只有一个种cell，DemoCell,它有一个对应的viewModel，DemoCellViewModel,在写的时候，cell不会出现在vc中。只要在组装好cell的viewModel，添加到sections.



## Requirements

iOS8+

## Installation

BRTableView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BRTableView'
```

## Author

sjwu1234@gmail.com, sjwu1234@gmail.com

## License

BRTableView is available under the MIT license. See the LICENSE file for more info.
