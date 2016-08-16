//
//  UITextField+BOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFont+BOBs.h"

@interface UITextField (BOBs)
+ (UITextField *)initWithFrame:(CGRect)frame
                   placeholder:(NSString *)placeholder
                         color:(UIColor *)color
                          font:(FontName)fontName
                          size:(float)size
                    returnType:(UIReturnKeyType)returnType
                  keyboardType:(UIKeyboardType)keyboardType
                        secure:(BOOL)secure
                   borderStyle:(UITextBorderStyle)borderStyle
            autoCapitalization:(UITextAutocapitalizationType)capitalization
            keyboardAppearance:(UIKeyboardAppearance)keyboardAppearence
 enablesReturnKeyAutomatically:(BOOL)enablesReturnKeyAutomatically
               clearButtonMode:(UITextFieldViewMode)clearButtonMode
            autoCorrectionType:(UITextAutocorrectionType)autoCorrectionType
                      delegate:(id<UITextFieldDelegate>)delegate;

#pragma mark - 设置键盘上方工具条
- (void)KeyboardToolView:(UIView*)keyBoardToolView;

@end
