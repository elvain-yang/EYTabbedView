//
//  ViewController.m
//  EYTabbedViewExample
//
//  Created by evlain_yang on 15/9/28.
//  Copyright (c) 2015年 evlain_yang. All rights reserved.
//

#import "ViewController.h"
#import "EYTabbedHeaderItem.h"
@interface ViewController ()
{
    UITableView *_tableView1;
    UIView *_view2;
    UITableView *_tableView3;
    UITableView *_tableView4;
    UITableView *_tableView5;
    UITableView *_tableView6;
    UITableView *_tableView7;
}
@end

static NSString *identifier = @"cell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    EYTabbedView *tabbedView = [[EYTabbedView alloc] initWithFrame:CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:tabbedView];
    
    tabbedView.delegate = self;
    tabbedView.dataSource = self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [self cellTitleForTableView:tableView];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(NSString *)cellTitleForTableView:(UITableView *)tableView
{
    if([tableView isEqual:_tableView1])
        return @"table1";
    if([tableView isEqual:_tableView3])
        return @"table2";
    if([tableView isEqual:_tableView4])
        return @"table3";
    if([tableView isEqual:_tableView5])
        return @"table4";
    if([tableView isEqual:_tableView6])
        return @"table5";
    if([tableView isEqual:_tableView7])
        return @"table6";
    return nil;
}

-(CGFloat)tabbedView:(EYTabbedView *)tabbedView widthForItemAtIndex:(NSUInteger)index
{
    if(index == 0)
        return 60;
    else if(index == 1)
        return 90;
    else if(index == 2)
        return 110;
    else if(index == 3)
        return 140;
    else if(index == 4)
        return 50;
    else if(index == 5)
        return 80;
    else if(index == 6)
        return 80;
    else
        return 0;
}

-(CGFloat)percentHeightOfHeaderInTabbedView
{
    return 1.0/12;
}

-(UIColor *)colorOfTabbedViewItem:(EYTabbedView *)tabbedView
{
    return [UIColor blueColor];
}

-(UIColor *)colorOfTabbedViewSelectedItem:(EYTabbedView *)tabbedView
{
    return [UIColor greenColor];
}

-(UIColor *)backgroundColorOfTabbedView:(EYTabbedView *)tabbedView
{
    return [UIColor orangeColor];
}

-(UIFont *)fontOfTabbedViewItem:(EYTabbedView *)tabbedView
{
    return [UIFont fontWithName:@"Arial" size:13];
}

-(UIColor *)colorOfSelectedLine:(EYTabbedView *)tabbedView
{
    return [UIColor grayColor];
}

-(UIView *)tabbedView:(EYTabbedView *)tabbedView viewForIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
        {
            _tableView1 = [[UITableView alloc] init];
            _tableView1.delegate = self;
            _tableView1.dataSource = self;
            return _tableView1;
        }
        case 1:
        {
            _view2 = [[UIView alloc] init];
            _view2.backgroundColor = [UIColor blueColor];
            return _view2;
        }
        case 2:
        {
            _tableView3 = [[UITableView alloc] init];
            _tableView3.delegate = self;
            _tableView3.dataSource = self;
            return _tableView3;
        }
        case 3:
        {
            _tableView4 = [[UITableView alloc] init];
            _tableView4.delegate = self;
            _tableView4.dataSource = self;
            return _tableView4;
        }
        case 4:
        {
            _tableView5 = [[UITableView alloc] init];
            _tableView5.delegate = self;
            _tableView5.dataSource = self;
            return _tableView5;
        }
        case 5:
        {
            _tableView6 = [[UITableView alloc] init];
            _tableView6.delegate = self;
            _tableView6.dataSource = self;
            return _tableView6;
        }
        case 6:
        {
            _tableView7 = [[UITableView alloc] init];
            _tableView7.delegate = self;
            _tableView7.dataSource = self;
            return _tableView7;
        }
        default:
            return nil;
    }
}

-(NSArray *)titleOfTabbedItem
{
    return @[@"测试1",@"测试22222",@"测试3333333333",@"测试 444444444444",@"测试5",@"测试6",@"测试77"];
}

-(NSUInteger)numberOfViewsInTabbedView
{
    return 7;
}

-(EYSelectedAniamedType)animatedTypeOfSelectedLine:(EYTabbedView *)tabbedView
{
    return EYSelectedAniamedTypeDefault;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
