//
//  NTNetUtil.h
//  SGShow
//
//  Created by fanshijian on 15-3-10.
//  Copyright (c) 2015年 fanshijian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NTHttpRequest.h"

@interface NTNetUtil : NSObject

/**
 * 数据请求
 **/
+ (void)sendRequestWithUrl:(NSString *)url
               requestName:(NSString *)requestName
                    method:(NTRequestMethod)methodType
                parameters:(id)parameters
                     block:(void (^)(NTHttpRequest *networkRequest, NSError *error))block;

/**
 * upload数据请求
 **/
+ (void)uploadRequestWithUrl:(NSString *)url
                 requestName:(NSString *)requestName
                      method:(NTRequestMethod)methodType
                  parameters:(id)parameters
                        data:(NSData *)data
                       block:(void (^)(NTHttpRequest *networkRequest, NSError *error))block;

+(void)postImgWithParam:(NSDictionary*)dic requestUrl:(NSString*)url dataArr:(NSArray*)arr block:(void (^)(NTHttpRequest *networkRequest, NSError *error))block;
+(void)postImgWithParam:(NSDictionary*)dic requestUrl:(NSString*)url dataArr:(NSArray*)arr voice:(NSData*)voiceData block:(void (^)(NTHttpRequest *networkRequest, NSError *error))block;

+(void)postMoreImgWithParam:(NSDictionary*)dic requestUrl:(NSString*)url allImgArr:(NSArray*)arr voice:(NSData*)voiceData block:(void (^)(NTHttpRequest *networkRequest, NSError *error))block;

////获取HTML5 URL
//+ (void)getSuccess:(void (^)(bool success))block;
@end
