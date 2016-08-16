//
//  UIWebView+BOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (BOBs)
/**
 *  Remove the background shadow of the UIWebView
 */
- (void)removeBackgroundShadow;

/**
 *  Load the requested website
 */
- (void)loadWebsite:(NSString *)website;
@end
