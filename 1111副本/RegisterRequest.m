//
//  RegisterRequest.m
//  1111
//
//  Created by 袁涛的大爷 on 16/6/29.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "RegisterRequest.h"

@implementation RegisterRequest
- (void)registerRequstWithUsername:(NSString *)username
                          password:(NSString *)password
                            avator:(UIImage *)image
                           success:(SuccessResponce)success
                           failure:(FailureResponce)failure{
    NSDictionary*parameter=@{@"userName":username,@"password":password};
    NetWorkRequest*request=[[NetWorkRequest alloc]init];
    [request sendImageWithUrl:RegisterRequest_Url parameter:parameter image:image successResponce:^(NSDictionary *dic) {
        success(dic);
    } failureResponce:^(NSError *error) {
        failure(error);
    }];
    
}
@end
