//
//  ActivityRequest.m
//  1111
//
//  Created by 袁涛的大爷 on 16/6/27.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "ActivityRequest.h"

@implementation ActivityRequest
- (void)activityRequestWithParameter:(NSDictionary *)parameterDic
                       success:(SuccessResponce)success
                       failure:(FailureResponce)failure{
    NetWorkRequest*request=[[NetWorkRequest alloc]init];
    [request requestWithUrl:ActivityRequest_Url parameters:parameterDic successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}
@end
