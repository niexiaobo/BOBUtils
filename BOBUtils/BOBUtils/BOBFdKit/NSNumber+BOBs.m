//
//  NSNumber+BOBs.m
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import "NSNumber+BOBs.h"

@implementation NSNumber (BOBs)
#if __cplusplus
extern "C" {
#endif
    CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;};
    CGFloat RadiansToDegrees(CGFloat radians) {return radians * 180 / M_PI;};
#if _cplusplus
}
#endif

+ (NSInteger)randomIntBetweenMin:(NSInteger)minValue andMax:(NSInteger)maxValue
{
    return (NSInteger)(minValue + [self randomFloat] * (maxValue - minValue));
}

+ (CGFloat)randomFloat
{
    return (float) arc4random() / UINT_MAX;
}

+ (CGFloat)randomFloatBetweenMin:(CGFloat)minValue andMax:(CGFloat)maxValue
{
    return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * (maxValue - minValue)) + minValue;
}

@end
