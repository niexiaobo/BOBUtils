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

/**
 *  Create an UILabel with the given parameters, with clearColor for the shadow
 *
 *  @param frame     Label's frame
 *  @param text      Label's text
 *  @param fontName  Label's font name, FontName enum is declared in UIFont+BFKit
 *  @param size      Label's font size
 *  @param color     Label's text color
 *  @param alignment Label's text alignment
 *  @param lines     Label's text lines
 *
 *  @return Return the created label
 */
+ (UILabel *)initWithFrame:(CGRect)frame
                      text:(NSString *)text
                      font:(FontName)fontName
                      size:(CGFloat)size
                     color:(UIColor *)color
                 alignment:(NSTextAlignment)alignment
                     lines:(NSInteger)lines;

/**
 *  Create an UILabel with the given parameters, with clearColor for the shadow
 *
 *  @param frame       Label's frame
 *  @param text        Label's text
 *  @param fontName    Label's font name, FontName enum is declared in UIFont+BFKit
 *  @param size        Label's font size
 *  @param color       Label's text color
 *  @param alignment   Label's text alignment
 *  @param lines       Label's text lines
 *  @param colorShadow Label's text shadow color
 *
 *  @return Return the created label
 */
+ (UILabel *)initWithFrame:(CGRect)frame
                      text:(NSString *)text
                      font:(FontName)fontName
                      size:(CGFloat)size
                     color:(UIColor *)color
                 alignment:(NSTextAlignment)alignment
                     lines:(NSInteger)lines
               shadowColor:(UIColor *)colorShadow;

@end
