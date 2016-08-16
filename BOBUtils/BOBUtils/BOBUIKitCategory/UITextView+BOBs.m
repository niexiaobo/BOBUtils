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
@end
