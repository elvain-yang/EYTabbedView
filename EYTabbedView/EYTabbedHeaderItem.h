//
//  EYTabbedHeaderItem.h
//  EYTabbedViewExample
//
//  Created by evlain_yang on 15/9/28.
//  Copyright (c) 2015年 evlain_yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EYTabbedHeaderView.h"
@interface EYTabbedHeaderItem : UIView

@property(nonatomic, weak, readonly)EYTabbedHeaderView *headerView;
@property(nonatomic, assign)CGFloat width;
@property(nonatomic, copy)NSString *title;
@property(nonatomic, strong)UIColor *titleColor;
@property(nonatomic, strong)UIColor *selectedTitleColor;
@property(nonatomic, assign)CGFloat position;
@property(nonatomic, strong)UIFont *font;

-(instancetype)init;
-(void)setOwnerTabbedHeaderView:(EYTabbedHeaderView *)headerView andItemPosition:(CGFloat)position;

@end
