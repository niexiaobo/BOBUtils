//
//  UIButton+BOBs.m
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import "UIButton+BOBs.h"
#import "UIImage+BOBs.h"
#import "UIColor+BOBs.h"


@implementation UIButton (BOBs)
+ (id)initWithFrame:(CGRect)frame
{
    return [UIButton initWithFrame:frame title:nil];
}

+ (id)initWithFrame:(CGRect)frame title:(NSString *)title
{
    return [UIButton initWithFrame:frame title:title backgroundImage:nil];
}

+ (id)initWithFrame:(CGRect)frame title:(NSString *)title backgroundImage:(UIImage *)backgroundImage
{
    return [UIButton initWithFrame:frame title:title backgroundImage:backgroundImage highlightedBackgroundImage:nil];
}

+ (id)initWithFrame:(CGRect)frame title:(NSString *)title backgroundImage:(UIImage *)backgroundImage highlightedBackgroundImage:(UIImage *)highlightedBackgroundImage
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightedBackgroundImage forState:UIControlStateHighlighted];
    
    return button;
}

+ (id)initWithFrame:(CGRect)frame title:(NSString *)title color:(UIColor *)color
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    return [UIButton initWithFrame:frame title:title backgroundImage:[UIImage imageWithColor:color] highlightedBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:components[0]-0.1 green:components[1]-0.1 blue:components[2]-0.1 alpha:1]]];
}

+ (id)initWithFrame:(CGRect)frame title:(NSString *)title color:(UIColor *)color highlightedColor:(UIColor *)highlightedColor
{
    return [UIButton initWithFrame:frame title:title backgroundImage:[UIImage imageWithColor:color] highlightedBackgroundImage:[UIImage imageWithColor:highlightedColor]];
}

+ (id)initWithFrame:(CGRect)frame color:(UIColor *)color
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    return [UIButton initWithFrame:frame title:nil backgroundImage:[UIImage imageWithColor:color] highlightedBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:components[0]-0.1 green:components[1]-0.1 blue:components[2]-0.1 alpha:1]]];
}

+ (id)initWithFrame:(CGRect)frame color:(UIColor *)color highlightedColor:(UIColor *)highlightedColor
{
    return [UIButton initWithFrame:frame title:nil backgroundImage:[UIImage imageWithColor:color] highlightedBackgroundImage:[UIImage imageWithColor:highlightedColor]];
}

+ (id)initWithFrame:(CGRect)frame image:(UIImage *)image
{
    return [UIButton initWithFrame:frame image:image highlightedImage:nil];
}

+ (id)initWithFrame:(CGRect)frame image:(UIImage *)image highlightedImage:(UIImage *)highlightedImage
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    
    return button;
}

- (void)setCornerRadius:(CGFloat)Radius BGColor:(UIColor*)BGColor Title:(NSString*)Title FoneSize:(int)FoneSize{
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:Radius];
    self.backgroundColor = BGColor;
    [self setTitle:Title forState:UIControlStateNormal];
    [self.titleLabel setFont:[UIFont systemFontOfSize:FoneSize]];
}

- (void)setborderWidth:(int)borderWidth ColorString:(NSString*)ColorString {
    self.layer.borderWidth = borderWidth;  // 给图层添加一个有色边框
    self.layer.borderColor = [UIColor colorWithHexString:ColorString].CGColor;
    
}

- (void)setTitleFont:(FontName)fontName size:(CGFloat)size
{
    [self.titleLabel setFont:[UIFont fontForFontName:fontName size:size]];
}

- (void)setTitleColor:(UIColor *)color
{
    [self setTitleColor:color highlightedColor:[UIColor colorWithColor:color alpha:0.4]];
}

- (void)setTitleColor:(UIColor *)color highlightedColor:(UIColor *)highlightedColor
{
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitleColor:highlightedColor forState:UIControlStateHighlighted];
}

@end
