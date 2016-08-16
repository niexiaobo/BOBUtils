//
//  UILabel+BOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFont+BOBs.h"
@interface UILabel (BOBs)

+ (UILabel *)initWithFrame:(CGRect)frame
                      text:(NSString *)text
                      font:(FontName)fontName
                      size:(CGFloat)size
                     color:(UIColor *)color
                 alignment:(NSTextAlignment)alignment
                     lines:(NSInteger)lines;

+ (UILabel *)initWithFrame:(CGRect)frame
                      text:(NSString *)text
                      font:(FontName)fontName
                      size:(CGFloat)size
                     color:(UIColor *)color
                 alignment:(NSTextAlignment)alignment
                     lines:(NSInteger)lines
               shadowColor:(UIColor *)colorShadow;

@end
