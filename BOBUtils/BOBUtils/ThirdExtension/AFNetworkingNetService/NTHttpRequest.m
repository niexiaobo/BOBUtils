//
//  NTHttpRequest.m
//  SGShow
//
//  Created by fanshijian on 15-3-10.
//  Copyright (c) 2015年 fanshijian. All rights reserved.
//

#import "NTHttpRequest.h"

@implementation NTHttpRequest
@synthesize requestName = _requestName;
@synthesize responseData;

- (void)executeHttpRequest:(NSString *)url
               requestName:(NSString *)requestName
                    method:(NTRequestMethod)methodType
                    params:(id)params
                     block:(void (^)(NTHttpRequest *networkRequest, NSError *error))block {
    NSLog(@"url:%@",url);
    [self setNetworkActivityStart];
    
    //  后台执行：
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // something
        // 主线程执行：
        dispatch_async(dispatch_get_main_queue(), ^{
            // something
        });
    });
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //manager.requestSerializer = [AFJSONRequestSerializer serializer]; // json请求
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    if (methodType == NTRequestMethodGET) {
        // get请求
        
        [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
           
            
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSLog(@"GET JSON: %@", responseObject);
            self.requestName = requestName;
            self.responseData = responseObject;
            
            [self setNetworkActivityEnd];
            if (block) {
                block(self,nil);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"GET Error: %@", error);
            [self setNetworkActivityEnd];
            if (block) {
                block(nil,error);
            }
            
        }];
        
    }else {
        // post请求
        NSString *str=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [manager POST:str parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"POST JSON: %@",responseObject);
            self.requestName = requestName;
            self.responseData = responseObject;
            [self setNetworkActivityEnd];
            if (block) {
                block(self,nil);
            }

            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            NSLog(@"POST Error: %@", error);
            [self setNetworkActivityEnd];
            if (block) {
                block(nil,error);
            }
        }];
    }
}

- (void)uploadHttpRequest:(NSString *)url
              requestName:(NSString *)requestName
                   method:(NTRequestMethod)methodType
                   params:(id)params
                     data:(NSData *)data
                    block:(void (^)(NTHttpRequest *networkRequest, NSError *error))block {
    NSLog(@"upload url:%@",url);
    [self setNetworkActivityStart];
    if (methodType == NTRequestMethodGET) {
        // 暂时没有
    }else {
        // post请求
        NSString *strurl=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        //manager.requestSerializer = [AFJSONRequestSerializer serializer]; // json请求
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
       
       [manager POST:strurl parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
           
           //            NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"test.jpg" withExtension:nil];
           // 要上传保存在服务器中的名称
           // 使用时间来作为文件名 2014-04-30 14:20:57.png
           // 让不同的用户信息,保存在不同目录中
           NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
           // 设置日期格式
           formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
           NSString *fileName = [formatter stringFromDate:[NSDate date]];
           
           [formData appendPartWithFileData:data name:@"file" fileName:fileName mimeType:@"image/png"];
           
       } progress:^(NSProgress * _Nonnull uploadProgress) {
           
           
       } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           
           NSLog(@"UPLOAD POST JSON: %@", responseObject);
           NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding (kCFStringEncodingGB_18030_2000);
           NSString *str= [[NSString alloc] initWithData:responseObject encoding:enc];
           if (!str) {
               str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
           }
           self.requestName = requestName;
           self.responseData = responseObject;
           [self setNetworkActivityEnd];
           if (block) {
               block(self,nil);
           }
           
       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           NSLog(@"POST Error: %@", error);
           [self setNetworkActivityEnd];
           if (block) {
               block(nil,error);
           }
           
       }];
        
       
    }
}

- (void)postImgWithParam:(NSDictionary*)dic requestUrl:(NSString*)url dataArr:(NSArray*)arr block:(void (^)(NTHttpRequest *networkRequest, NSError *error))block {
    [self postImgWithParam:dic requestUrl:url dataArr:arr voice:nil block:block];
}


-(void)postImgWithParam:(NSDictionary*)dic requestUrl:(NSString*)url dataArr:(NSArray*)arr voice:(NSData*)voiceData block:(void (^)(NTHttpRequest *networkRequest, NSError *error))block
{
    [self setNetworkActivityStart];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // something
        // 主线程执行：
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
    });
    NSString *str=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //manager.requestSerializer = [AFJSONRequestSerializer serializer]; // json请求
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:str parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (arr) {
            if (arr) {
                for(int i=0; i<arr.count; i++){
                    UIImage *eachImg = [arr objectAtIndex:i];//300
                    CGSize imagesize = eachImg.size;
                    //                    if ([url isEqualToString:UserGetTopicAPI]) {
                    //                        CGFloat mHeight = imagesize.height/3;
                    //                        imagesize.height =mHeight;
                    //                        imagesize.width =mHeight;
                    //                        eachImg = [self imageWithImage:eachImg scaledToSize:imagesize];
                    //                        NSData *eachImgData = UIImageJPEGRepresentation(eachImg, 0.5);
                    //                        [formData appendPartWithFileData:eachImgData name:[NSString stringWithFormat:@"file%d.jpg", i+1] fileName:[NSString stringWithFormat:@"images"] mimeType:@"image/jpeg"];
                    //                    }else{
                    //                        imagesize.height =140;
                    //                        imagesize.width =140;
                    CGFloat mHeight = imagesize.height/2;
                    imagesize.height =mHeight;
                    imagesize.width =mHeight;
                    //eachImg = [self imageWithImage:eachImg scaledToSize:imagesize];
                    eachImg = [self imageWithImage:eachImg scaledToSize:imagesize];
                    NSData *eachImgData = UIImageJPEGRepresentation(eachImg, 0.5);
                    [formData appendPartWithFileData:eachImgData name:[NSString stringWithFormat:@"file%d.jpg", i+1] fileName:[NSString stringWithFormat:@"images"] mimeType:@"image/jpeg"];
                    // }
                    
                }
            }
            if (voiceData) {
                //语音
                [formData appendPartWithFileData:voiceData name:@"Audio.wav" fileName:[NSString stringWithFormat:@"Audio"] mimeType:@"audio/wav"];
            }
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.responseData = responseObject;
        NSLog(@"myPost JSON: %@", responseObject);
        block(self,nil);
        [self setNetworkActivityEnd];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@" myPOST Error: %@", error);
        block(nil,error);
        [self setNetworkActivityEnd];
        
    }];
    
}
- (void)setNetworkActivityStart {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)setNetworkActivityEnd {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

//对图片尺寸进行压缩--

-(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize

{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
    
}

@end
