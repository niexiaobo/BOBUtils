//
//  LimitInput.m
//  iOStest
//
//  Created by GG on 16/8/10.
//  Copyright © 2016年 GG. All rights reserved.
//

#import "LimitInput.h"
#import <objc/runtime.h>
/**
 *  UITextView的类目的实现
 */
@implementation UITextView (Limit)


- (void)setLimitInput:(NSNumber *)limitInput{
    
    objc_setAssociatedObject(self, @selector(limitInput), limitInput, OBJC_ASSOCIATION_ASSIGN);
}


- (NSNumber *)limitInput{
    
    return objc_getAssociatedObject(self, @selector(limitInput));
}


@end

/**
 *  UITextFile的类目的实现
 */
@implementation UITextField (Limit)


- (void)setLimitInput:(NSNumber *)limitInput{

    objc_setAssociatedObject(self, @selector(limitInput), limitInput, OBJC_ASSOCIATION_ASSIGN);
}

- (NSNumber *)limitInput{
    
    return objc_getAssociatedObject(self, @selector(limitInput));
}

@end

/**
 *  用来处理输入框变化的通知
 */
@implementation LimitInput

/**
 *  在AppDelegate中的didFinishLaunchingWithOptions之前便会自动调用每个类中的load方法，
 */
+ (void)load{
    
    [super load];
    
    [LimitInput shareLimitInput];
    
}

+ (instancetype)shareLimitInput{
    
    static LimitInput *limitInput = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        limitInput = [[LimitInput alloc]init];
        
    });
    
    return limitInput;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldViewDidChange:) name:UITextFieldTextDidChangeNotification object: nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidChange:) name:UITextViewTextDidChangeNotification object: nil];
        
    }
    return self;
}

-(void)textFieldViewDidChange:(NSNotification*)notification {
    
    UITextField *textField = (UITextField *)notification.object;
    
    NSNumber *number = textField.limitInput;
    
    if (number && textField.text.length > [number integerValue] && textField.markedTextRange == nil) {
        textField.text = [textField.text substringWithRange: NSMakeRange(0, [number integerValue])];
    }
}


-(void) textViewDidChange: (NSNotification *) notificaiton {
   
    UITextView *textView = (UITextView *)notificaiton.object;
    
    NSNumber *number = textView.limitInput;
    
    if (number && textView.text.length > [number integerValue] && textView.markedTextRange == nil) {
        textView.text = [textView.text substringWithRange: NSMakeRange(0, [number integerValue])];
    }
}


@end
