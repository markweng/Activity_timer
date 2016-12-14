//
//  ViewController.m
//  Timer_demo
//
//  Created by Wong on 2016/12/13.
//  Copyright © 2016年 com.wong.t.c.h. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"
#import "MyFooterView.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, copy) NSString *nameStr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _dataSource = [NSMutableArray array];
    _nameStr = @"全部";
    [self createDataSource];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)createDataSource {
    
    [_dataSource removeAllObjects];

    for (NSInteger i=0; i<100; i++) {
        NSInteger num = arc4random()%10000;
        DataCenter *dc = [[DataCenter alloc] initWithDate:num];
        dc.status = arc4random()%5;
        [_dataSource addObject:dc];
    }
    [_tableview reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return _dataSource.count;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section {

    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *cellid = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@+%zd+%zd",_nameStr,indexPath.section, indexPath.row];
    return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 44;

}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    DataCenter *dc = _dataSource[section];
    if (dc.status == 0) {
        return 0.1;
    }
    return 50;

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 0.1;

}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:
 (NSInteger)section {
    
    static NSString *footer = @"footer";
    DataCenter *dc = _dataSource[section];

    if (dc.status == 0) {
        return nil;
    }
    MyFooterView  *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:footer];
    if (!view) {
        view = [[MyFooterView alloc] initWithReuseIdentifier:footer];
    }
    view.dc = _dataSource[section];
    return view;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)allAction:(id)sender {
    UIButton *btn = sender;
    _nameStr = btn.titleLabel.text;
    [self createDataSource];
}
- (IBAction)waitPayAction:(id)sender {
    
    UIButton *btn = sender;
    _nameStr = btn.titleLabel.text;
    [self createDataSource];

}

- (IBAction)waitIncomeAction:(id)sender {
    
    UIButton *btn = sender;
    _nameStr = btn.titleLabel.text;
    [self createDataSource];

}
- (IBAction)finishedAction:(id)sender {
    
    UIButton *btn = sender;
    _nameStr = btn.titleLabel.text;
    [self createDataSource];

}

@end
