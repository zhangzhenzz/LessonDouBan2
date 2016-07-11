//
//  DouBanTabBar.m
//  1111
//
//  Created by 袁涛的大爷 on 16/6/28.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "DouBanTabBar.h"

@implementation DouBanTabBar

//不能在init系之外的方法更改self
- (id)initWithItems:(NSArray *)items frame:(CGRect)frame{
    self = [super init];
    if (self) {
        self.frame=frame;
        for (int i = 0; i<items.count; i++) {
            UIButton *button = items[i];
            CGFloat width = self.bounds.size.width/items.count;
            CGFloat height = self.bounds.size.height;
            button.frame=CGRectMake(i*width, 0, width, height);
            [self addSubview:button];
            [button addTarget:self action:@selector(buttonClicked:) forControlEvents:(UIControlEventTouchUpInside)];
        }
        self.currentSelected = 0;
        self.currentSelectedItem = items[0];
        self.allItems = items;
        //它的属性在初始化的时候赋值
    }
    return self;
}
- (void)buttonClicked:(UIButton*)button{
    self.currentSelectedItem = button;
    for (int i = 0; i < self.allItems.count; i++) {
        UIButton*tempBtn = self.allItems[i];
        if (button == tempBtn) {
            self.currentSelected = i;
            tempBtn.selected=YES;
        }else{
            tempBtn.selected=NO;
        }
    }
    //是代理让tabbar上的图标把动作委托给Controller 这个与tableView的代理是一样的
    if (_douBanDelegate) {
        [_douBanDelegate douBanItemDidClicked:self];
    }
    
}
@end
