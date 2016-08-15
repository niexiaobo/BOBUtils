//
//  UIButton+BOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFont+BOBs.h"
@interface UIButton (BOBs)

/**
 *  Create an UIButton in a frame
 *
 *  @param frame Button's frame
 *
 *  @return Return the UIButton instance
 */
+ (id)initWithFrame:(CGRect)frame;

/**
 *  Create an UIButton in a frame with a title and a clear color
 *
 *  @param frame Button's frame
 *  @param title Button's title, the title color will be white
 *
 *  @return Return the UIButton instance
 */
+ (id)initWithFrame:(CGRect)frame
              title:(NSString *)title;

/**
 *  Create an UIButton in a frame with a title and a background image
 *
 *  @param frame           Button's frame
 *  @param title           Button's title
 *  @param backgroundImage Button's background image
 *
 *  @return Return the UIButton instance
 */
+ (id)initWithFrame:(CGRect)frame
              title:(NSString *)title
    backgroundImage:(UIImage *)backgroundImage;

/**
 *  Create an UIButton in a frame with a title, a background image and highlighted background image
 *
 *  @param frame                      Button's frame
 *  @param title                      Button's title
 *  @param backgroundImage            Button's background image
 *  @param highlightedBackgroundImage Button's highlighted background image
 *
 *  @return Return the UIButton instance
 */
+ (id)initWithFrame:(CGRect)frame
              title:(NSString *)title
    backgroundImage:(UIImage *)backgroundImage
highlightedBackgroundImage:(UIImage *)highlightedBackgroundImage;

/**
 *  Create an UIButton in a frame with a title and a color
 *
 *  @param frame Button's frame
 *  @param title Button's title
 *  @param color Button's color, the highlighted color will be automatically created
 *
 *  @return Return the UIButton instance
 */
+ (id)initWithFrame:(CGRect)frame
              title:(NSString *)title
              color:(UIColor *)color;

/**
 *  Create an UIButton in a frame with a title, a color and highlighted color
 *
 *  @param frame            Button's frame
 *  @param title            Button's title
 *  @param color            Button's color
 *  @param highlightedColor Button's highlighted color
 *
 *  @return Return the UIButton instance
 */
+ (id)initWithFrame:(CGRect)frame
              title:(NSString *)title
              color:(UIColor *)color
   highlightedColor:(UIColor *)highlightedColor;

/**
 *  Create an UIButton in a frame with a color
 *
 *  @param frame Button's frame
 *  @param color Button's color, the highlighted color will be automatically created
 *
 *  @return Return the UIButton instance
 */
+ (id)initWithFrame:(CGRect)frame
              color:(UIColor *)color;

/**
 *  Create an UIButton in a frame with a color and highlighted color
 *
 *  @param frame            Button's frame
 *  @param color            Button's color
 *  @param highlightedColor Button's highlighted color
 *
 *  @return Return the UIButton instance
 */
+ (id)initWithFrame:(CGRect)frame
              color:(UIColor *)color
   highlightedColor:(UIColor *)highlightedColor;

/**
 *  Create an UIButton in a frame with an image
 *
 *  @param frame Button's frame
 *  @param image Button's image
 *
 *  @return Return the UIButton instance
 */
+ (id)initWithFrame:(CGRect)frame
              image:(UIImage *)image;

/**
 *  Create an UIButton in a frame with an image
 *
 *  @param frame            Button's frame
 *  @param image            Button's image
 *  @param highlightedImage Button's highlighted image
 *
 *  @return Return the UIButton instance
 */
+ (id)initWithFrame:(CGRect)frame
              image:(UIImage *)image
   highlightedImage:(UIImage *)highlightedImage;

/**
 *  Set the title font with a size
 *
 *  @param fontName Font name from the FontName enum declared in UIFont+BFKit
 *  @param size     Font size
 */
- (void)setTitleFont:(FontName)fontName
                size:(CGFloat)size;

/**
 *  Set the title color
 *
 *  @param color Font color, the highlighted color will be automatically created
 */
- (void)setTitleColor:(UIColor *)color;

/**
 *  Set the title color and highlighted color
 *
 *  @param color            Button's color
 *  @param highlightedColor Button's highlighted color
 */
- (void)setTitleColor:(UIColor *)color
     highlightedColor:(UIColor *)highlightedColor;
@end
