//
//  EntriesModel.m
//  豆瓣
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 fwlong. All rights reserved.
//

#import "EntriesModel.h"

@implementation EntriesModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        _ID=value;
    }
}
-(NSString *)description{
    return [NSString stringWithFormat:@"ID %@ image %@",self.ID,self.images];
}

@end
