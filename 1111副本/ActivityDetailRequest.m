//
//  ActivityDetailRequest.m
//  1111
//
//  Created by 袁涛的大爷 on 16/6/28.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "ActivityDetailRequest.h"

@implementation ActivityDetailRequest

-(void)activityDetailRequestWithParameter:(NSDictionary *)parameter
                                  success:(SuccessResponce)success
                                  failure:(FailureResponce)failure{
    NetWorkRequest *request=[[NetWorkRequest alloc] init];
    NSString *ID=[parameter objectForKey:@"id"];
    
    [request requestWithUrl:ActivityDetailRequest_Url(ID) parameters:parameter successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
    
}

@end
