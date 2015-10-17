# EYTabbedView
## 强大的自定义标签页视图

![](https://github.com/elvain-yang/EYTabbedView/blob/master/Image/readme.gif)

###控件说明 EXPLAIN
    1.本框架使用OC编写，swift版本会在以后更新。
    2.样式类似搜狐新闻、网易新闻等客户端的标签页视图，可以随意自定义控件样式，动画等。
    3.框架暂时没有添加AutoLayout支持，所以需要使用frame创建。

###框架特性
    1.自定义框架样式，各个部件的颜色、位置包括动画等。
    2.采用类UITableView设计方式，使用delegate和dataSouece来定制控件。
    3.EYTabbedHeaderView也是可以拿出来单独使用的，用法代码中有详细注释
    4.无依赖框架。

###使用说明 USAGE
####创建
    EYTabbedView *tabbedView = [[EYTabbedView alloc] initWithFrame:CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:tabbedView];
    
    tabbedView.delegate = self;
    tabbedView.dataSource = self;

####delegate
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
####dataSource
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
    
##版权 RIGHTS
本框架由elvain_yang制作，保留一切权利
