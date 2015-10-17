//
//  EYTabbedView.m
//  EYTabbedViewExample
//
//  Created by evlain_yang on 15/9/28.
//  Copyright (c) 2015年 evlain_yang. All rights reserved.
//

#import "EYTabbedView.h"
#import "EYTabbedHeaderItem.h"

//默认选择头部视图占高度比例
#define DEFAULT_TITLE_HEIGHT_RATE 1.0/8

@interface EYTabbedView()
{
    NSMutableArray *_tabbedTableViews;
    NSMutableArray *_tabbedItems;
    NSArray *_tabbedItemTitleStrings;
    NSMutableArray *_tabbedItemWidth;
    
    EYTabbedHeaderView *_headerView;
    UIScrollView *_scrollView;
    
    NSUInteger _tableViewsCount;

    UIColor *_headerViewItemColor;
    UIColor *_headerViewItemSelectedColor;
    UIColor *_headerViewBackgroundColor;
    UIColor *_headerViewLineSelectedColor;
    UIFont *_headerViewItemFont;

    EYSelectedAniamedType _animatedType;
    
}
@end

@implementation EYTabbedView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        _headerView = [[EYTabbedHeaderView alloc] initWithFrame:CGRectMake(0,0, frame.size.width, frame.size.height * DEFAULT_TITLE_HEIGHT_RATE)];
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,_headerView.frame.size.height, frame.size.width, frame.size.height * (1 - DEFAULT_TITLE_HEIGHT_RATE))];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.delegate = self;

        [self addSubview:_headerView];
        [self addSubview:_scrollView];
        
        _delegate = nil;
        _dataSource = nil;
        
        _tableViewsCount = 0;
    }
    return self;
}

/*
 *  delegate setter方法，用于处理所有的代理方法回调。
 *  optional方法需要验证代理对象是否实现。required方法直接调用。
 *  和dataSource共同决定才能回调的方法，需要判断是否设置了代理，这点在dataSource setter中相同。
 */
-(void)setDelegate:(id<EYTabbedViewDelegate>)delegate
{
    _delegate = delegate;
    
    if([_delegate respondsToSelector:@selector(percentHeightOfHeaderInTabbedView)])
    {
        [self resizeFrameUsingPercent];
    }
    if([_delegate respondsToSelector:@selector(colorOfTabbedViewItem:)])
    {
        _headerViewItemColor = [_delegate colorOfTabbedViewItem:self];
    }
    if([_delegate respondsToSelector:@selector(colorOfTabbedViewSelectedItem:)])
    {
        _headerViewItemSelectedColor = [_delegate colorOfTabbedViewSelectedItem:self];
    }
    if([_delegate respondsToSelector:@selector(backgroundColorOfTabbedView:)])
    {
        _headerViewBackgroundColor = [_delegate backgroundColorOfTabbedView:self];
    }
    if([_delegate respondsToSelector:@selector(fontOfTabbedViewItem:)])
    {
        _headerViewItemFont  = [_delegate fontOfTabbedViewItem:self];
    }
    if([_delegate respondsToSelector:@selector(colorOfSelectedLine:)])
    {
        _headerViewLineSelectedColor = [_delegate colorOfSelectedLine:self];
    }
    if([_delegate respondsToSelector:@selector(animatedTypeOfSelectedLine:)])
    {
        _animatedType = [_delegate animatedTypeOfSelectedLine:self];
    }
    if(_dataSource)
    {
        [self initTabbedItemWidth];
        [self addTitleViewDelegateAndDataSource];
    }
}

/*
 *  dataSource setter方法，用于处理所有的代理方法回调
 *  optional方法需要验证代理对象是否实现。required方法直接调用。
 *  和delegate共同决定才能回调的方法，需要判断是否设置了代理，这点在delegate setter中相同
 */
-(void)setDataSource:(id<EYTabbedViewDataSource>)dataSource
{
    _dataSource = dataSource;
    _tableViewsCount = [_dataSource numberOfViewsInTabbedView];
    [self setScrollViewContentSize];
    [self initTabbedTableViews];
    _tabbedItemTitleStrings = [_dataSource titleOfTabbedItem];
    
    if(_delegate)
    {
        [self initTabbedItemWidth];
        [self addTitleViewDelegateAndDataSource];
    }
}

/*
 *  获取所有内容视图，并根据index设置位置，方法需同时设置delegate和dataSource才能回调
 */
-(void)initTabbedTableViews
{
    _tabbedTableViews = [[NSMutableArray alloc] initWithCapacity:_tableViewsCount];
    for(int i = 0 ; i < _tableViewsCount ; i++)
    {
        UIView *view = [_dataSource tabbedView:self viewForIndex:i];
        view.frame = CGRectMake(_scrollView.frame.size.width * i, 0, _scrollView.frame.size.width, _scrollView.frame.size.height);
        [_tabbedTableViews addObject:view];
        [_scrollView addSubview:view];
    }
}

/*
 *  获取详细内容视图个数后重新设置scrollView的contentSize
 */
-(void)setScrollViewContentSize;
{
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width * _tableViewsCount, _scrollView.frame.size.height)];
}

/*
 *  获取每个头部视图单元格宽度
 */
-(void)initTabbedItemWidth
{
    _tabbedItemWidth = [[NSMutableArray alloc] initWithCapacity:_tableViewsCount];
    _tabbedItems = [[NSMutableArray alloc] initWithCapacity:_tableViewsCount];
    for(int i = 0; i < _tableViewsCount ; i++)
    {
        [_tabbedItemWidth addObject:[NSNumber numberWithFloat:[_delegate tabbedView:self widthForItemAtIndex:i]]];
    }
}

/*
 *  根据头部视图百分比重新设置头部视图和详细内容视图的frame
 */
-(void)resizeFrameUsingPercent
{
    CGFloat percent = [_delegate percentHeightOfHeaderInTabbedView];
    if(percent >= 1.0 || percent <= 0.0)
    {
        return;
    }
    else
    {
        _headerView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height * percent);
        _scrollView.frame = CGRectMake(0, _headerView.frame.size.height, self.frame.size.width, self.frame.size.height * (1 - percent));
    }
}

/*
 *  设置头部视图的代理和数据源，执行头部视图的代理和数据源回调，需在处理完成本类的所有代理和数据回调后执行
 */
-(void)addTitleViewDelegateAndDataSource
{
    _headerView.delegate = self;
    _headerView.dataSource = self;
}

#pragma mark EYTabbedHeaderViewDelegate

-(CGFloat)tabbedHeaderView:(EYTabbedHeaderView *)headerView widthForItemAtIndex:(NSUInteger)index
{
    return [[_tabbedItemWidth objectAtIndex:index] floatValue];
}

-(void)tabbedHeaderView:(EYTabbedHeaderView *)headerView didSelectItemAtIndex:(NSUInteger)index
{
    CGPoint movePoint = CGPointMake(_scrollView.frame.origin.x + _scrollView.frame.size.width * index, 0);
    [_scrollView setContentOffset:movePoint animated:NO];
}

-(UIColor *)colorOfTabbedHeaderViewItem:(EYTabbedHeaderView *)headerView
{
    return _headerViewItemColor;
}

-(UIColor *)colorOfTabbedHeaderViewSelectedItem:(EYTabbedHeaderView *)headerView
{
    return _headerViewItemSelectedColor;
}

-(UIColor *)backgroundColorOfTabbedHeaderView:(EYTabbedHeaderView *)headerView
{
    return _headerViewBackgroundColor;
}

-(UIFont *)fontOfTabbedHeaderViewItem:(EYTabbedHeaderView *)headerView
{
    return _headerViewItemFont;
}

-(UIColor *)colorOfSelectedLine:(EYTabbedHeaderView *)headerView
{
    return _headerViewLineSelectedColor;
}

-(EYSelectedAniamedType)animatedTypeOfSelectedLine:(EYTabbedHeaderView *)headerView
{
    return _animatedType;
}

#pragma mark EYTabbedHeaderViewDataSource

-(EYTabbedHeaderItem *)tabbedHeaderView:(EYTabbedHeaderView *)headerView itemAtIndex:(NSUInteger)index
{
    EYTabbedHeaderItem *item = [[EYTabbedHeaderItem alloc] init];
    [item setTitle:[_tabbedItemTitleStrings objectAtIndex:index]];
    [_tabbedItems addObject:item];
    return item;
}

-(NSUInteger)numberOfItemForTabbedHeaderView:(EYTabbedHeaderView *)headerView
{
    return _tableViewsCount;
}

#pragma mark UIScrollViewDelegate
/*
 *  根据scrollView的contentOffset来判断滚动到了哪一个视图，从而改变头部视图的选中状态
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat positionX = scrollView.contentOffset.x;
    NSUInteger index = positionX / self.frame.size.width;
    [_headerView setSelectedItem:[_tabbedItems objectAtIndex:index]];
}

@end
