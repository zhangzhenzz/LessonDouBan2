//
//  ActivityModel.m
//  1111
//
//  Created by 袁涛的大爷 on 16/6/27.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "ActivityModel.h"

@implementation ActivityModel

-(NSString*)description{
    return [NSString stringWithFormat:@"===============\nID %@   Owner %@  ",self.ID,self.user];
}

//快速断点 comd+\
//.h .m相互切换 ctrl+comd+上下
//comd+kongge 查询
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        _ID=value;
    }else if ([key isEqualToString:@"owner"]){//重写owner解析方法
        OwnerModel *model=[[OwnerModel alloc] init];
        [model setValuesForKeysWithDictionary:value];
        _user=model;
    }
}

@end
