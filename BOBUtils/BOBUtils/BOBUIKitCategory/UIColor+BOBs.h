//
//  UIColor+BOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (BOBs)

+ (UIColor *)colorWithHexString:(NSString *)hexString;

+ (UIColor *)colorWithHex:(unsigned int)hex;

+ (UIColor *)colorWithHex:(unsigned int)hex
                    alpha:(float)alpha;

+ (UIColor *)randomColor;

+ (UIColor *)colorWithColor:(UIColor *)color
                      alpha:(float)alpha;
@end
