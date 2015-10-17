//
//  EYTabbedView.h
//  EYTabbedViewExample
//
//  Created by evlain_yang on 15/9/28.
//  Copyright (c) 2015年 evlain_yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EYTabbedHeaderView.h"

@class EYTabbedView;


@protocol EYTabbedViewDelegate <NSObject>

@required
/**
 *  设置选择头部视图单元格宽度
 */
-(CGFloat)tabbedView:(EYTabbedView *)tabbedView widthForItemAtIndex:(NSUInteger)index;

@optional

/**
 *  设置选择头部视图占的半分比，剩余的为内容视图高度
 */
-(CGFloat)percentHeightOfHeaderInTabbedView;

/**
 *  设置选择头部视图单元格字体颜色
 */
-(UIColor *)colorOfTabbedViewItem:(EYTabbedView *)tabbedView;

/**
 *  设置选择头部视图单元格字体选中颜色
 */
-(UIColor *)colorOfTabbedViewSelectedItem:(EYTabbedView *)tabbedView;

/**
 *  设置选择头部视图背景颜色
 */
-(UIColor *)backgroundColorOfTabbedView:(EYTabbedView *)tabbedView;

/**
 *  设置选择头部视图单元格字体
 */
-(UIFont *)fontOfTabbedViewItem:(EYTabbedView *)tabbedView;

/**
 *  设置选择头部视图选择线颜色
 */
-(UIColor *)colorOfSelectedLine:(EYTabbedView *)tabbedView;

/**
 *  设置选择线动画
 *
 */
-(EYSelectedAniamedType)animatedTypeOfSelectedLine:(EYTabbedView *)tabbedView;
@end

@protocol EYTabbedViewDataSource <NSObject>

@required

/*
 *  获取对应下标的详细视图，该视图对应的是同一下标的选择头部单元视图
 */
-(UIView *)tabbedView:(EYTabbedView *)tabbedView viewForIndex:(NSUInteger)index;

/*
 *  获取选择头部视图单元视图标题
 */
-(NSArray *)titleOfTabbedItem;

/*
 *  获取选择头部视图单元格的数目和详细视图的数目，两者的数量应该一致
 */
-(NSUInteger)numberOfViewsInTabbedView;

@end

/*
 *  选择视图类，包含了选择头部视图和内容视图两部分，实现了选择头部的代理和数据源
 *  主要结构为头部视图和详细视图，均为本对象成员变量。
 */
@interface EYTabbedView : UIView<EYTabbedHeaderViewDelegate,SYTabbedTitleViewDataSource,UIScrollViewDelegate>

@property (nonatomic , weak)id<EYTabbedViewDelegate>delegate;
@property (nonatomic , weak)id<EYTabbedViewDataSource>dataSource;

@end
