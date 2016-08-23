//
//  NetEngine.m
//  wuye
//
//  Created by zoe on 14-9-9.
//  Copyright (c) 2014年 上海泓智信息科技有限公司. All rights reserved.
//

#import "NetEngine.h"
#import "AppDelegate.h"
//#import "JsonResponseModel.h"
//#import "LoginJsonModel.h"
//#import "LoginViewController.h"
#define XcodeAppVersion     [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define XcodeAppBundleVersion       [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

@implementation NetEngine


- (NSString *)getPlistUrl:(NSString *)apiKey {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"API.plist" ofType:nil];
    NSDictionary *urlPlist = [[NSDictionary dictionaryWithContentsOfFile:path] objectForKey:apiKey];
    return [urlPlist objectForKey:@"path"];
}

- (NSString *)getResponseBase:(NSString *)apiKey {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"API.plist" ofType:nil];
    NSDictionary *urlPlist = [[NSDictionary dictionaryWithContentsOfFile:path] objectForKey:apiKey];
    return [urlPlist objectForKey:@"ResponseClass"];
}

- (void)NetEngineWithUrl:(NSString *)urlkey andDic:dic completionHandler:(NSResultResponseBlock)block errorHandler:(ErrorWithJsonResponseBlock) errorBlock{
    [self requestByUrl:[self getPlistUrl:urlkey] dic:dic completionHandler:block errorHandler:errorBlock];
}

- (void)NetEngineWithUrlBase:(NSString *)urlkey andDic:dic andResponseClass:(NSString *)responseClass completionHandler:(NSResultResponseBlockBase)block errorHandler:(ErrorWithJsonResponseBlock) errorBlock{
    NSLog(@"%@",[self getPlistUrl:urlkey]);
    [self requestByUrlBase:[self getPlistUrl:urlkey] dic:dic andResponseClass:[self getResponseBase:urlkey] completionHandler:block errorHandler:errorBlock];
}

- (void)NetEngineWithUrl:(NSString *)urlkey dic:(NSDictionary *)dic imageData:(NSData *)imageData key:(NSString *)key mimeType:(NSString *)mimeType fileName:(NSString *)fileName completionHandler:(NSResultResponseBlock)block errorHandler:(ErrorWithJsonResponseBlock)errorBlock {
    [self requestByUrl:[self getPlistUrl:urlkey] dic:(NSDictionary *)dic imageData:(NSData *)imageData mimeType:(NSString *)mimeType key:(NSString *)key fileName:(NSString *)fileName completionHandler:block errorHandler:errorBlock];
}

#pragma mark - 多张图片
- (void)NetEngineWithUrl:(NSString *)urlkey dic:(NSDictionary *)dic imageArray:(NSArray *)imageArray key:(NSString *)key mimeType:(NSString *)mimeType completionHandler:(NSResultResponseBlock)block errorHandler:(ErrorWithJsonResponseBlock)errorBlock {
    [self requestByUrl:[self getPlistUrl:urlkey] dic:(NSDictionary *)dic imageArray:(NSArray *)imageArray mimeType:(NSString *)mimeType key:(NSString *)key completionHandler:block errorHandler:errorBlock];
}

- (void)requestByUrl:(NSString *)url dic:(NSDictionary *)Dic imageArray:(NSArray *)imageArray mimeType:(NSString *)mimeType key:(NSString *)key completionHandler:(NSResultResponseBlock)block errorHandler:(ErrorWithJsonResponseBlock)errorBlock {
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]initWithDictionary:Dic];
    //    dic[@"session_id"] = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:@"session_id"];
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:AppInfoService customHeaderFields:nil];
    MKNetworkOperation *operation = [engine operationWithPath:url params:dic httpMethod:@"POST"];
    operation.stringEncoding = NSUTF8StringEncoding;
    
    for (int i=0; i<imageArray.count; i++) {
        UIImage *image = imageArray[i];
        NSString *fileName = @"IosPostImage";
        NSString *themeName = [NSString stringWithFormat:@"complain%d%d",(int)[[NSDate new] timeIntervalSince1970],i];
        fileName = [fileName stringByAppendingString:themeName];
        NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
        [operation addData:imageData forKey:key mimeType:mimeType fileName:fileName];
    }
    
    NSLog(@"%@",operation);
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        // 获得返回的数据（字符串形式）
        NSString *result = [completedOperation responseString];//responseData 二进制形式
        NSLog(@"%@==",result);
        NSData *metOfficeData = [[completedOperation responseString] dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *DIC = [NSJSONSerialization JSONObjectWithData:metOfficeData                                                            options:kNilOptions                                                              error:&err];
        
//        if ([DIC[@"code"] intValue] == 1000) {
//            APIUserPlugin *user = [[APIUserPlugin alloc] init];
//            [user onInit];
//            [user resetProfileConfig];
//        }
        
        if(err) {
            NSLog(@"json解析失败：%@",err);
        }else{
            NSLog(@"json解析成功：%@",DIC);
        }
        block(DIC,[completedOperation responseString]);
    }  errorHandler:^(MKNetworkOperation *errorOp, NSError *error) {
        errorBlock(errorOp.responseJSON,error);
        NSLog(@"请求出错");
    }];
    [self enqueueOperation:operation];
}



#pragma mark- 公用请求方法
-(void)requestByUrlBase:(NSString *)url dic:(NSDictionary *)Dic andResponseClass:(NSString *)responseClass completionHandler:(NSResultResponseBlockBase)block errorHandler:(ErrorWithJsonResponseBlock)errorBlock{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]initWithDictionary:Dic];
//    dic[@"session_id"] = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:@"session_id"];
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:AppInfoService customHeaderFields:nil];
    MKNetworkOperation *operation = [engine operationWithPath:url params:dic httpMethod:@"POST"];
    operation.stringEncoding = NSUTF8StringEncoding;
    NSLog(@"%@",operation);
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        // 获得返回的数据（字符串形式）
        NSString *result = [completedOperation responseString];//responseData 二进制形式
        NSLog(@"%@==",result);
        NSData *metOfficeData = [[completedOperation responseString] dataUsingEncoding:NSUTF8StringEncoding];
        //       SStringEncoding enc =  CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingUTF8)
        NSError *err;
        NSDictionary *DIC = [NSJSONSerialization JSONObjectWithData:metOfficeData                                                            options:kNilOptions                                                              error:&err];
//        id response = [[NSClassFromString(responseClass) alloc] initWithDictionary:DIC error:nil];
        
//        if ([DIC[@"code"] intValue] == 1000) {
//            APIUserPlugin *user = [[APIUserPlugin alloc] init];
//            [user onInit];
//            [user resetProfileConfig];
//        }
        NSLog(@"%d====",[DIC[@"data"] isKindOfClass:[NSDictionary class]]);
        if(err) {
            NSLog(@"json解析失败：%@",err);
        }else{
            NSLog(@"json解析成功：%@",DIC);
        }
        block(DIC,[completedOperation responseString]);
    }  errorHandler:^(MKNetworkOperation *errorOp, NSError *error) {
        errorBlock(errorOp.responseJSON,error);
        NSLog(@"请求出错");
    }];
    [self enqueueOperation:operation];
}


-(void)requestByUrl:(NSString *)url dic:(NSDictionary *)Dic completionHandler:(NSResultResponseBlock)block errorHandler:(ErrorWithJsonResponseBlock)errorBlock{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]initWithDictionary:Dic];
//    dic[@"session_id"] = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:@"session_id"];
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:AppInfoService customHeaderFields:nil];
    MKNetworkOperation *operation = [engine operationWithPath:url params:dic httpMethod:@"POST"];
    operation.stringEncoding = NSUTF8StringEncoding;
    NSLog(@"%@",operation);
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        // 获得返回的数据（字符串形式）
        NSString *result = [completedOperation responseString];//responseData 二进制形式
        NSLog(@"%@==",result);
        NSData *metOfficeData = [[completedOperation responseString] dataUsingEncoding:NSUTF8StringEncoding];
        //       SStringEncoding enc =  CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingUTF8)
        NSError *err;
        NSDictionary *DIC = [NSJSONSerialization JSONObjectWithData:metOfficeData                                                            options:kNilOptions                                                              error:&err];
        
//        if ([DIC[@"code"] intValue] == 1000) {
//            APIUserPlugin *user = [[APIUserPlugin alloc] init];
//            [user onInit];
//            [user resetProfileConfig];
//        }
        
        if(err) {
            NSLog(@"json解析失败：%@",err);
        }else{
            NSLog(@"json解析成功：%@",DIC);
        }
        block(DIC,[completedOperation responseString]);
    }  errorHandler:^(MKNetworkOperation *errorOp, NSError *error) {
        errorBlock(errorOp.responseJSON,error);
        NSLog(@"请求出错");
    }];
    [self enqueueOperation:operation];
}

- (void)requestByUrl:(NSString *)url dic:(NSDictionary *)Dic imageData:(NSData *)imageData mimeType:(NSString *)mimeType key:(NSString *)key fileName:(NSString *)fileName completionHandler:(NSResultResponseBlock)block errorHandler:(ErrorWithJsonResponseBlock)errorBlock {
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]initWithDictionary:Dic];
//    dic[@"session_id"] = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:@"session_id"];
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:AppInfoService customHeaderFields:nil];
    MKNetworkOperation *operation = [engine operationWithPath:url params:dic httpMethod:@"POST"];
    operation.stringEncoding = NSUTF8StringEncoding;
    [operation addData:imageData forKey:key mimeType:mimeType fileName:fileName];
    
    NSLog(@"%@",operation);
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        // 获得返回的数据（字符串形式）
        NSString *result = [completedOperation responseString];//responseData 二进制形式
        NSLog(@"%@==",result);
        NSData *metOfficeData = [[completedOperation responseString] dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *DIC = [NSJSONSerialization JSONObjectWithData:metOfficeData                                                            options:kNilOptions                                                              error:&err];
        
        
        if(err) {
            NSLog(@"json解析失败：%@",err);
        }else{
            NSLog(@"json解析成功：%@",DIC);
        }
        block(DIC,[completedOperation responseString]);
    }  errorHandler:^(MKNetworkOperation *errorOp, NSError *error) {
        errorBlock(errorOp.responseJSON,error);
        NSLog(@"请求出错");
    }];
    [self enqueueOperation:operation];
}

@end
