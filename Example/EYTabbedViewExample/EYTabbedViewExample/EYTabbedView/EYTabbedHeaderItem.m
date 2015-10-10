//
//  EYTabbedHeaderItem.m
//  EYTabbedViewExample
//
//  Created by evlain_yang on 15/9/28.
//  Copyright (c) 2015年 evlain_yang. All rights reserved.
//

#import "EYTabbedHeaderItem.h"

@interface EYTabbedHeaderItem()
{
    UIButton *_btn;
    NSUInteger index;
}
@end

@implementation EYTabbedHeaderItem

-(instancetype)init
{
    self = [super init];
    if(self)
    {
        _btn = [[UIButton alloc] init];
        [self addSubview:_btn];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}


-(void)setOwnerTabbedHeaderView:(EYTabbedHeaderView *)titleView andItemPosition:(CGFloat)position
{
    _headerView = titleView;
    self.frame = CGRectMake(position, 0, _width, titleView.frame.size.height);
    _btn.frame = CGRectMake(0, 0, _width, titleView.frame.size.height);
    [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btnClick
{
    [_headerView setSelectedItem:self];
}

-(void)setFont:(UIFont *)font
{
    [_btn.titleLabel setFont:font];
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    [_btn setTitle:title forState:UIControlStateNormal];
}

-(void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    [_btn setTitleColor:_titleColor forState:UIControlStateNormal];
}

-(void)setSelectedTitleColor:(UIColor *)selectedTitleColor
{
    _selectedTitleColor = selectedTitleColor;
    [_btn setTitleColor:selectedTitleColor forState:UIControlStateSelected];
}

-(void)setWidth:(CGFloat)width
{
    _width = width;
}

@end
