//
//  EYTabbedHeaderViewView.h
//  EYTabbedViewExample
//
//  Created by evlain_yang on 15/9/28.
//  Copyright (c) 2015年 evlain_yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EYTabbedHeaderView;
@class EYTabbedHeaderItem;
@protocol EYTabbedHeaderViewDelegate <NSObject>

@required
/*
 *  单元格宽度
 */
-(CGFloat)tabbedHeaderView:(EYTabbedHeaderView *)headerView widthForItemAtIndex:(NSUInteger)index;

@optional

/*
 *  点击回调事件
 */
-(void)tabbedHeaderView:(EYTabbedHeaderView *)headerView didSelectItemAtIndex:(NSUInteger)index;

/*
 *  单元格标题颜色
 */
-(UIColor *)colorOfTabbedHeaderViewItem:(EYTabbedHeaderView *)headerView;

/*
 *  单元格标题选择颜色
 */
-(UIColor *)colorOfTabbedHeaderViewSelectedItem:(EYTabbedHeaderView *)headerView;

/*
 *  背景颜色
 */
-(UIColor *)backgroundColorOfTabbedHeaderView:(EYTabbedHeaderView *)headerView;

/*
 *  标题字体
 */
-(UIFont *)fontOfTabbedHeaderViewItem:(EYTabbedHeaderView *)headerView;

/*
 *  选择线颜色
 */
-(UIColor *)colorOfSelectedLine:(EYTabbedHeaderView *)headerView;

@end

@protocol SYTabbedTitleViewDataSource <NSObject>

@required

/*
 *  单元格实例，包含标题
 */
-(EYTabbedHeaderItem *)tabbedHeaderView:(EYTabbedHeaderView *)headerView itemAtIndex:(NSUInteger)index;

/*
 *  单元格个数
 */
-(NSUInteger)numberOfItemForTabbedHeaderView:(EYTabbedHeaderView *)headerView;

@end

@interface EYTabbedHeaderView : UIView

@property(nonatomic, weak)id<EYTabbedHeaderViewDelegate>delegate;
@property(nonatomic, weak)id<SYTabbedTitleViewDataSource>dataSource;
@property(nonatomic, readonly, assign)NSUInteger itemCount;
@property(nonatomic, readonly)UIColor *titleColor;
@property(nonatomic, readonly)UIColor *selectedTitleColor;
@property(nonatomic, readonly)UIFont *font;
@property(nonatomic, readonly)UIColor *titleViewBackgroundColor;
@property(nonatomic, readonly)UIColor *selecetViewColor;

-(void)setSelectedItem:(EYTabbedHeaderItem *)item;

@end
