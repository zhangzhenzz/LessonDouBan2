//
//  ActivityDetailRequest.h
//  1111
//
//  Created by 袁涛的大爷 on 16/6/28.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityDetailRequest : NSObject
-(void)activityDetailRequestWithParameter:(NSDictionary *)parameter
                                  success:(SuccessResponce)success
                                  failure:(FailureResponce)failure;
@end
