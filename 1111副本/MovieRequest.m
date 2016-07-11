//
//  MovieRequest.m
//  1111
//
//  Created by 袁涛的大爷 on 16/6/27.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "MovieRequest.h"

@implementation MovieRequest
-(void)movieRequestWithParameters:(NSDictionary *)parameters
                   success:(SuccessResponce)success
                   failure:(FailureResponce)failure{
    NetWorkRequest*request=[[NetWorkRequest alloc] init];
    [request requestWithUrl:MovieRequest_Url parameters:parameters successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}
@end
