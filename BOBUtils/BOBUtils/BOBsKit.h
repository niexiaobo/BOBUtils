//
//  BOBsKit.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

/**
 *  Here is some useful defined variables
 */
#define BFKIT_VERSION @"1.0"

/**
 *  Get the iOS version
 */
#define IOS_VERSION [UIDevice currentDevice].systemVersion

/**
 *  Get the screen width and height
 */
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

/**
 *  Get some App info
 */
#define APP_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define APP_BUILD [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#ifdef DEBUG
#define LOG(...) NSLog(__VA_ARGS__);
#define LOG_METHOD NSLog(@"%s", __func__);
#else
#define LOG(...);
#define LOG_METHOD;
#endif

/**
 *  Foundation Additions
 */
#import "NSArray+BOBs.h"
#import "NSDate+BOBs.h"
#import "NSFileManager+BOBs.h"
#import "NSMutableArray+BOBs.h"
#import "NSNumber+BOBs.h"
#import "NSProcessInfo+BOBs.h"
#import "NSString+BOBs.h"

/**
 *   Additions
 */
#import "UIButton+BOBs.h"
#import "UIColor+BOBs.h"
#import "UIDevice+BOBs.h"
#import "UIFont+BOBs.h"
#import "UIImage+BOBs.h"
#import "UIImageView+BOBs.h"
#import "UILabel+BOBs.h"
#import "UIScrollView+BOBs.h"
#import "UITableView+BOBs.h"
#import "UITextField+BOBs.h"
#import "UIView+BOBs.h"
#import "UIViewExt.h"
#import "UIWebView+BOBs.h"
#import "UIWindow+BOBs.h"

/**
 *   Classes
 */
#import "PasswordBOBs.h"
#import "SystemSoundBOBs.h"
