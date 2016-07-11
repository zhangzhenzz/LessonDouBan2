//
//  NetWorkRequest.h
//  1111
//
//  Created by 袁涛的大爷 on 16/6/27.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "BaseRequest.h"
//成功回调
typedef void(^SuccessResponce)(NSDictionary*dic);
//失败回调
typedef void(^FailureResponce)(NSError*error);

@interface NetWorkRequest : BaseRequest

//请求数据
//- (void)  (NSString *)
- (void)requestWithUrl:(NSString *)url
            parameters:(NSDictionary *)parameterDic
       successResponse:(SuccessResponce)success
       failureResponse:(FailureResponce)failure;

- (void)sendDataWithUrl:(NSString *)url
             parameters:(NSDictionary *)parameterDic
                success:(SuccessResponce)success
                failure:(FailureResponce)failure;
- (void)sendImageWithUrl:(NSString *)url
               parameter:(NSDictionary*)parameterDic
                   image:(UIImage*)uploadImage
         successResponce:(SuccessResponce)success
         failureResponce:(FailureResponce)failure;

@end
