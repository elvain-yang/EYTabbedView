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
    NSArray *_tableViews;
}
@end

static NSString *identifier = @"cell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    EYTabbedView *titleView = [[EYTabbedView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:titleView];
    
    UITableView *tableView1 = [[UITableView alloc] init];
    tableView1.delegate = self;
    tableView1.dataSource = self;
    
    UITableView *tableView2 = [[UITableView alloc] init];
    tableView2.delegate = self;
    tableView2.dataSource = self;
    
    UITableView *tableView3 = [[UITableView alloc] init];
    tableView3.delegate = self;
    tableView3.dataSource = self;
    
    UITableView *tableView4 = [[UITableView alloc] init];
    tableView4.delegate = self;
    tableView4.dataSource = self;
    
    UITableView *tableView5 = [[UITableView alloc] init];
    tableView5.delegate = self;
    tableView5.dataSource = self;
    
    UITableView *tableView6 = [[UITableView alloc] init];
    tableView6.delegate = self;
    tableView6.dataSource = self;
    
    UITableView *tableView7 = [[UITableView alloc] init];
    tableView7.delegate = self;
    tableView7.dataSource = self;
    
    _tableViews = @[tableView1,tableView2,tableView3,tableView4,tableView5,tableView6,tableView7];
    
    titleView.delegate = self;
    titleView.dataSource = self;
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
    if([tableView isEqual:[_tableViews objectAtIndex:0]])
        return @"table1";
    if([tableView isEqual:[_tableViews objectAtIndex:1]])
        return @"table2";
    if([tableView isEqual:[_tableViews objectAtIndex:2]])
        return @"table3";
    if([tableView isEqual:[_tableViews objectAtIndex:3]])
        return @"table4";
    if([tableView isEqual:[_tableViews objectAtIndex:4]])
        return @"table5";
    if([tableView isEqual:[_tableViews objectAtIndex:5]])
        return @"table6";
    if([tableView isEqual:[_tableViews objectAtIndex:6]])
        return @"table7";
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
    return [_tableViews objectAtIndex:index];
}

-(NSArray *)titleOfTabbedItem
{
    return @[@"测试1",@"测试22222",@"测试3333333333",@"测试 444444444444",@"测试5",@"测试6",@"测试77"];
}

-(NSUInteger)numberOfViewsInTabbedView
{
    return 7;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
