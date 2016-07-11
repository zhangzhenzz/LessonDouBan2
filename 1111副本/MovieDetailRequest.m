//
//  MovieDetailRequest.m
//  1111
//
//  Created by 袁涛的大爷 on 16/6/28.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "MovieDetailRequest.h"

@implementation MovieDetailRequest
-(void)movieDetailWithParameter:(NSDictionary*)parameter
                        success:(SuccessResponce)success
                        failure:(FailureResponce)failure{
    NetWorkRequest*request=[[NetWorkRequest alloc] init];
    NSString*ID=[parameter objectForKey:@"id"];
    [request requestWithUrl:MovieDetailRequest_Url(ID) parameters:parameter successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}
@end
