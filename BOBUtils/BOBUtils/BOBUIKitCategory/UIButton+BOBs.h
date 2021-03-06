//
//  UIButton+BOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFont+BOBs.h"
#import <objc/runtime.h>

@interface UIButton (BOBs)

#pragma mark - 新增title属性
@property (nonatomic, copy) NSString *title;

#pragma mark - 初始化
+ (id)initWithFrame:(CGRect)frame;

+ (id)initWithFrame:(CGRect)frame
              title:(NSString *)title;

+ (id)initWithFrame:(CGRect)frame
              title:(NSString *)title
    backgroundImage:(UIImage *)backgroundImage;

+ (id)initWithFrame:(CGRect)frame
              title:(NSString *)title
    backgroundImage:(UIImage *)backgroundImage
highlightedBackgroundImage:(UIImage *)highlightedBackgroundImage;


+ (id)initWithFrame:(CGRect)frame
              title:(NSString *)title
              color:(UIColor *)color;

+ (id)initWithFrame:(CGRect)frame
              title:(NSString *)title
              color:(UIColor *)color
   highlightedColor:(UIColor *)highlightedColor;

+ (id)initWithFrame:(CGRect)frame
              color:(UIColor *)color;

+ (id)initWithFrame:(CGRect)frame
              color:(UIColor *)color
   highlightedColor:(UIColor *)highlightedColor;

+ (id)initWithFrame:(CGRect)frame
              image:(UIImage *)image;

+ (id)initWithFrame:(CGRect)frame
              image:(UIImage *)image
   highlightedImage:(UIImage *)highlightedImage;


- (void)setTitleFont:(FontName)fontName
                size:(CGFloat)size;

#pragma mark - 设置圆角
- (void)setCornerRadius:(CGFloat)Radius BGColor:(UIColor*)BGColor Title:(NSString*)Title FoneSize:(int)FoneSize;

#pragma mark - 边框颜色
- (void)setborderWidth:(int)borderWidth ColorString:(NSString*)ColorString;

- (void)setTitleColor:(UIColor *)color;

- (void)setTitleColor:(UIColor *)color
     highlightedColor:(UIColor *)highlightedColor;



@end
