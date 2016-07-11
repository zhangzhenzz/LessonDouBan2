//
//  LoginRequest.h
//  1111
//
//  Created by 袁涛的大爷 on 16/6/29.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginRequest : NSObject
- (void)loginRequstWithUsername:(NSString *)username
                       password:(NSString *)password
                        success:(SuccessResponce)success
                        failure:(FailureResponce)failure;
@end
