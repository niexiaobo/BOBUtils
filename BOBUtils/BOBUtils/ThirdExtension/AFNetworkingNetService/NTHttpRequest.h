//
//  NTHttpRequest.h
//  SGShow
//
//  Created by fanshijian on 15-3-10.
//  Copyright (c) 2015年 fanshijian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
//#import "JSONKit.h"
#import "MBProgressHUD.h"

typedef enum {
    /** GET请求 **/
    NTRequestMethodGET,
    /** POST请求**/
    NTRequestMethodPOST
}NTRequestMethod;



@interface NTHttpRequest : NSObject

@property (nonatomic, strong) NSString *requestName;
@property (nonatomic, strong) id responseData;

// 不带图片的请求方法
- (void)executeHttpRequest:(NSString *)url
               requestName:(NSString *)requestName
                    method:(NTRequestMethod)methodType
                    params:(id)params
                     block:(void (^)(NTHttpRequest *networkRequest, NSError *error))block;

// 带图片的请求方法
- (void)uploadHttpRequest:(NSString *)url
              requestName:(NSString *)requestName
                   method:(NTRequestMethod)methodType
                   params:(id)params
                     data:(NSData *)data
                    block:(void (^)(NTHttpRequest *networkRequest, NSError *error))block;

-(void)postImgWithParam:(NSDictionary*)dic requestUrl:(NSString*)url dataArr:(NSArray*)arr block:(void (^)(NTHttpRequest *networkRequest, NSError *error))block;

-(void)postImgWithParam:(NSDictionary*)dic requestUrl:(NSString*)url dataArr:(NSArray*)arr voice:(NSData*)voiceData block:(void (^)(NTHttpRequest *networkRequest, NSError *error))block;



@end
