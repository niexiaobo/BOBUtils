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

#pragma mark - 重写text属性
@property (nonatomic, copy) NSString *text;

#pragma mark - 初始化
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
