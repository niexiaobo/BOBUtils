//
//  UITextView+BOBs.m
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import "UITextView+BOBs.h"

@implementation UITextView (BOBs)
#pragma mark - 设置键盘上方工具条
- (void)KeyboardToolView:(UIView*)keyBoardToolView {
    if (self && keyBoardToolView) {
        self.inputAccessoryView  = keyBoardToolView;
    }
}

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

@end
