//
//  NSNumber+BOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSNumber (BOBs)
#if __cplusplus
extern "C" {
#endif
    
    CGFloat DegreesToRadians(CGFloat degrees);
    
    CGFloat RadiansToDegrees(CGFloat radians);
#if _cplusplus
}
#endif


+ (NSInteger)randomIntBetweenMin:(NSInteger)minValue
                          andMax:(NSInteger)maxValue;

+ (CGFloat)randomFloat;

+ (CGFloat)randomFloatBetweenMin:(CGFloat)minValue
                          andMax:(CGFloat)maxValue;
@end
