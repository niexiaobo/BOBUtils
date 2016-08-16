//
//  UITextField+BOBs.m
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import "UITextField+BOBs.h"

@implementation UITextField (BOBs)
+ (UITextField *)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder color:(UIColor *)color font:(FontName)fontName size:(float)size returnType:(UIReturnKeyType)returnType keyboardType:(UIKeyboardType)keyboardType secure:(BOOL)secure borderStyle:(UITextBorderStyle)borderStyle autoCapitalization:(UITextAutocapitalizationType)capitalization keyboardAppearance:(UIKeyboardAppearance)keyboardAppearence enablesReturnKeyAutomatically:(BOOL)enablesReturnKeyAutomatically clearButtonMode:(UITextFieldViewMode)clearButtonMode autoCorrectionType:(UITextAutocorrectionType)autoCorrectionType delegate:(id<UITextFieldDelegate>)delegate
{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    [textField setBorderStyle:borderStyle];
    [textField setAutocorrectionType:autoCorrectionType];
    [textField setClearButtonMode:clearButtonMode];
    [textField setKeyboardType:keyboardType];
    [textField setAutocapitalizationType:capitalization];
    [textField setPlaceholder:placeholder];
    [textField setTextColor:color];
    [textField setReturnKeyType:returnType];
    [textField setEnablesReturnKeyAutomatically:enablesReturnKeyAutomatically];
    [textField setSecureTextEntry:secure];
    [textField setKeyboardAppearance:keyboardAppearence];
    [textField setFont:[UIFont fontForFontName:fontName size:size]];
    [textField setDelegate:delegate];
    
    return textField;
}

#pragma mark - 设置键盘上方工具条
- (void)KeyboardToolView:(UIView*)keyBoardToolView {
    if (self && keyBoardToolView) {
        self.inputAccessoryView  = keyBoardToolView;
    }
}


@end
