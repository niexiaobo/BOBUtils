//
//  NTNetUtil.m
//  SGShow
//
//  Created by fanshijian on 15-3-10.
//  Copyright (c) 2015年 fanshijian. All rights reserved.
//

#import "NTNetUtil.h"

@implementation NTNetUtil

/**
 * 数据请求
 **/
+ (void)sendRequestWithUrl:(NSString *)url
               requestName:(NSString *)requestName
                    method:(NTRequestMethod)methodType
                parameters:(id)parameters
                     block:(void (^)(NTHttpRequest *networkRequest, NSError *error))block {
    dispatch_queue_t aQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(aQueue, ^{
        @autoreleasepool {
            NTHttpRequest *request = [[NTHttpRequest alloc] init];
            [request executeHttpRequest:url requestName:requestName method:methodType params:parameters block:block];
        }
    });
}

/**
 * upload数据请求
 **/
+ (void)uploadRequestWithUrl:(NSString *)url
                 requestName:(NSString *)requestName
                      method:(NTRequestMethod)methodType
                  parameters:(id)parameters
                        data:(NSData *)data
                       block:(void (^)(NTHttpRequest *networkRequest, NSError *error))block {
    dispatch_queue_t aQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(aQueue, ^{
        @autoreleasepool {
            NTHttpRequest *request = [[NTHttpRequest alloc] init];
            [request uploadHttpRequest:url requestName:requestName method:methodType params:parameters data:data block:block];
        }
    });
}
+(void)postImgWithParam:(NSDictionary*)dic requestUrl:(NSString*)url dataArr:(NSArray*)arr  block:(void (^)(NTHttpRequest *networkRequest, NSError *error))block
{
    dispatch_queue_t aQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(aQueue, ^{
        @autoreleasepool {
            NTHttpRequest *request = [[NTHttpRequest alloc] init];
            [request postImgWithParam:dic requestUrl:url dataArr:arr block:block];
        }
    });
}

+(void)postImgWithParam:(NSDictionary*)dic requestUrl:(NSString*)url dataArr:(NSArray*)arr voice:(NSData*)voiceData block:(void (^)(NTHttpRequest *networkRequest, NSError *error))block
{
    dispatch_queue_t aQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(aQueue, ^{
        @autoreleasepool {
            NTHttpRequest *request = [[NTHttpRequest alloc] init];
            [request postImgWithParam:dic requestUrl:url dataArr:arr voice:voiceData block:block];
        }
    });
}

+(void)postMoreImgWithParam:(NSDictionary*)dic requestUrl:(NSString*)url allImgArr:(NSArray*)arr voice:(NSData*)voiceData block:(void (^)(NTHttpRequest *networkRequest, NSError *error))block{
    dispatch_queue_t aQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(aQueue, ^{
        @autoreleasepool {
            NTHttpRequest *request = [[NTHttpRequest alloc] init];
            [request postImgWithParam:dic requestUrl:url dataArr:arr voice:voiceData block:block];
        }
    });

}



@end


