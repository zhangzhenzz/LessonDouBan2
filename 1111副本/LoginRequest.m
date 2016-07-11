//
//  LoginRequest.m
//  1111
//
//  Created by 袁涛的大爷 on 16/6/29.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "LoginRequest.h"

@implementation LoginRequest
- (void)loginRequstWithUsername:(NSString *)username
                       password:(NSString *)password
                        success:(SuccessResponce)success
                        failure:(FailureResponce)failure{
    NetWorkRequest *request=[[NetWorkRequest alloc] init];
    [request sendDataWithUrl:LoginRequest_Url parameters:@{@"userName":username,@"password":password} success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
@end
