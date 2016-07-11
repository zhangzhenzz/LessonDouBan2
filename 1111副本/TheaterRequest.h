//
//  TheaterRequest.h
//  1111
//
//  Created by 袁涛的大爷 on 16/6/27.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TheaterRequest : NSObject
-(void)theaterRequestWithParameters:(NSDictionary *)parameters
                            success:(SuccessResponce)success
                            failure:(FailureResponce)failure;
@end
