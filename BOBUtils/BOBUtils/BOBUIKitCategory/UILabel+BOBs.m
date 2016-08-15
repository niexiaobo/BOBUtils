//
//  UILabel+BOBs.m
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import "UILabel+BOBs.h"

@implementation UILabel (BOBs)
+ (UILabel *)initWithFrame:(CGRect)frame text:(NSString *)text font:(FontName)fontName size:(CGFloat)size color:(UIColor *)color alignment:(NSTextAlignment)alignment lines:(NSInteger)lines
{
    return [UILabel initWithFrame:frame text:text font:fontName size:size color:color alignment:alignment lines:lines shadowColor:[UIColor clearColor]];
}

+ (UILabel *)initWithFrame:(CGRect)frame text:(NSString *)text font:(FontName)fontName size:(CGFloat)size color:(UIColor *)color alignment:(NSTextAlignment)alignment lines:(NSInteger)lines shadowColor:(UIColor *)colorShadow
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    [label setFont:[UIFont fontForFontName:fontName size:size]];
    [label setText:text];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:color];
    [label setShadowColor:colorShadow];
    [label setTextAlignment:alignment];
    [label setNumberOfLines:lines];
    
    return label;
}
@end
