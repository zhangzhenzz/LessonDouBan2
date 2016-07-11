//
//  NetWorkRequest.m
//  1111
//
//  Created by 袁涛的大爷 on 16/6/27.
//  Copyright © 2016年 zhangzhen. All rights reserved.
//

#import "NetWorkRequest.h"

@implementation NetWorkRequest
- (void)requestWithUrl:(NSString*)url
            parameters:(NSDictionary*)parameterDic
       successResponse:(SuccessResponce)success
       failureResponse:(FailureResponce)failure{
    
    AFHTTPSessionManager*manager=[AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager GET:url parameters:parameterDic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

//"为什么不用+方法""这个问题问的好 因为我随手写了个-"
- (void)sendDataWithUrl:(NSString *)url
             parameters:(NSDictionary *)parameterDic
                success:(SuccessResponce)success
                failure:(FailureResponce)failure{
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    [manager POST:url parameters:parameterDic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

//上传图片
- (void)sendImageWithUrl:(NSString *)url
               parameter:(NSDictionary*)parameterDic
                   image:(UIImage*)uploadImage
         successResponce:(SuccessResponce)success
         failureResponce:(FailureResponce)failure{
    AFHTTPSessionManager*manager=[AFHTTPSessionManager manager];
    [manager POST:url parameters:parameterDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //上传头像
        [formData appendPartWithFileData:UIImageJPEGRepresentation(uploadImage, 0.5) name:@"avatar" fileName:@"avatar.jpg" mimeType:@"application/octet-stream"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
@end
