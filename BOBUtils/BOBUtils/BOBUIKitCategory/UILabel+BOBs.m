//
//  UILabel+BOBs.m
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import "UILabel+BOBs.h"
@interface UILabel()

@property (nonatomic, copy)NSString *changgText;

@end

@implementation UILabel (BOBs)

#pragma mark - 重写text属性
- (NSString *)text {
    return objc_getAssociatedObject(self, @selector(text));
}

- (void)setText:(NSString *)text {
    NSString *tempText = (text==nil||[text isKindOfClass:[NSNull class]]?@"":text);
    if ([tempText isKindOfClass:[NSNumber class]]) {
        tempText = [NSString stringWithFormat:@"%@",tempText];
    } else if (![tempText isKindOfClass:[NSString class]]) {
        tempText = @"";
    }
    objc_setAssociatedObject(self, @selector(text), tempText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - 初始化
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
