//
//  PasswordBOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  Password strength level enum, from 0 (min) to 6 (max)
 */
typedef NS_ENUM(NSInteger, PasswordStrengthLevel)
{
    PasswordStrengthLevelVeryWeak = 0,
    PasswordStrengthLevelWeak,
    PasswordStrengthLevelAverage,
    PasswordStrengthLevelStrong,
    PasswordStrengthLevelVeryStrong,
    PasswordStrengthLevelSecure,
    PasswordStrengthLevelVerySecure
};

@interface PasswordBOBs : NSObject

+ (PasswordStrengthLevel)checkPasswordStrength:(NSString *)password;
@end
