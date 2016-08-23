//
//  LimitInput.h
//  iOStest
//
//  Created by GG on 16/8/10.
//  Copyright © 2016年 GG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  UITextFile的类目的声明
 */
@interface UITextField (Limit)

//限制的字数，在此是利用Runtime给类目添加如下属性
@property (nonatomic,strong) NSNumber *limitInput;

@end

/**
 *  UITextView的类目
 */
@interface UITextView (Limit)

//限制的字数，在此是利用Runtime给类目添加如下属性
@property (nonatomic,strong) NSNumber *limitInput;

@end


/**
 *  用来处理输入框变化的通知
 */
@interface LimitInput : NSObject

@end
