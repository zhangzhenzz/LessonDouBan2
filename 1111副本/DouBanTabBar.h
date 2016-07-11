//
//  DouBanTabBar.h
//  1111
//
//  Created by 袁涛的大爷 on 16/6/28.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//
@class DouBanTabBar;
@protocol DouBanTabBarDelegate <NSObject>

- (void)douBanItemDidClicked:(DouBanTabBar *)tabBar;

@end

#import <UIKit/UIKit.h>

@interface DouBanTabBar : UITabBar
//当前选中的tabBarItem
@property (nonatomic, assign) int currentSelected;
//当前选中的Item
@property (nonatomic, strong) UIButton *currentSelectedItem;
//tabBar上所有的items
@property (nonatomic, strong) NSArray *allItems;
//id就是代理可以给任何东西执行
@property (nonatomic, weak) id<DouBanTabBarDelegate>douBanDelegate;










- (id)initWithItems:(NSArray *)items frame:(CGRect)frame;

@end
