//
//  NetEngine.h
//  wuye
//
//  Created by zoe on 14-9-9.
//  Copyright (c) 2014年 上海泓智信息科技有限公司. All rights reserved.
//

#import "MKNetworkEngine.h"
#import "AppDelegate.h"

#define AppInfoService @"189.189.9.0" //服务器地址


@interface NetEngine : MKNetworkEngine

typedef void (^NSResultResponseBlockBase)(id responseJson,NSString* string);
typedef void (^NSResultResponseBlock)(NSDictionary * DIC,NSString* string);
typedef void (^ErrorWithJsonResponseBlock)(id jsonObject, NSError* error);

- (void)NetEngineWithUrl:(NSString *)urlkey dic:(NSDictionary *)dic imageData:(NSData *)imageData key:(NSString *)key mimeType:(NSString *)mimeType fileName:(NSString *)fileName completionHandler:(NSResultResponseBlock)block errorHandler:(ErrorWithJsonResponseBlock) errorBlock;

- (void)NetEngineWithUrl:(NSString *)urlkey andDic:dic completionHandler:(NSResultResponseBlock)block errorHandler:(ErrorWithJsonResponseBlock) errorBlock;

- (void)NetEngineWithUrlBase:(NSString *)urlkey andDic:dic andResponseClass:(NSString *)responseClass completionHandler:(NSResultResponseBlockBase)block errorHandler:(ErrorWithJsonResponseBlock) errorBlock;
#pragma mark- 公用请求方法
-(void)requestByUrl:(NSString *)url dic:(NSDictionary *)Dic completionHandler:(NSResultResponseBlock)block errorHandler:(ErrorWithJsonResponseBlock)errorBlock;

-(void)requestByUrlBase:(NSString *)url dic:(NSDictionary *)Dic andResponseClass:(NSString *)responseClass completionHandler:(NSResultResponseBlockBase)block errorHandler:(ErrorWithJsonResponseBlock)errorBlock;

- (void)requestByUrl:(NSString *)url dic:(NSDictionary *)Dic imageData:(NSData *)imageData mimeType:(NSString *)mimeType key:(NSString *)key fileName:(NSString *)fileName completionHandler:(NSResultResponseBlock)block errorHandler:(ErrorWithJsonResponseBlock)errorBlock;

#pragma mark - 多张图片
- (void)NetEngineWithUrl:(NSString *)urlkey dic:(NSDictionary *)dic imageArray:(NSArray *)imageArray key:(NSString *)key mimeType:(NSString *)mimeType completionHandler:(NSResultResponseBlock)block errorHandler:(ErrorWithJsonResponseBlock)errorBlock;

@end

