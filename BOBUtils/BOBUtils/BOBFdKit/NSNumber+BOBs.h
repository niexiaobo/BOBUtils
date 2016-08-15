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
    /**
     *  Degrees to radians conversion
     *
     *  @param degrees Degrees to be converter
     *
     *  @return Return the convertion result
     */
    CGFloat DegreesToRadians(CGFloat degrees);
    /**
     *  Radians to degrees conversion
     *
     *  @param radians Radians to be converter
     *
     *  @return Return the convertion result
     */
    CGFloat RadiansToDegrees(CGFloat radians);
#if _cplusplus
}
#endif

/**
 *  Create a random integer between the given range
 *
 *  @param minValue Mininum random value
 *  @param maxValue Maxinum random value
 *
 *  @return Return the created random integer
 */
+ (NSInteger)randomIntBetweenMin:(NSInteger)minValue
                          andMax:(NSInteger)maxValue;

/**
 *  Create a random float
 *
 *  @return Return the created random float
 */
+ (CGFloat)randomFloat;

/**
 *  Create a random float between the given range
 *
 *  @param minValue Mininum random value
 *  @param maxValue Maxinum random value
 *
 *  @return Return the created random float
 */
+ (CGFloat)randomFloatBetweenMin:(CGFloat)minValue
                          andMax:(CGFloat)maxValue;
@end
