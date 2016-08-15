//
//  UIWebView+BOBs.m
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import "UIWebView+BOBs.h"

@implementation UIWebView (BOBs)
- (void)removeBackgroundShadow
{
    for(UIView *eachSubview in [self.scrollView subviews])
    {
        if([eachSubview isKindOfClass:[UIImageView class]] && eachSubview.frame.origin.x <= 500)
        {
            eachSubview.hidden = YES;
            [eachSubview removeFromSuperview];
        }
    }
}

- (void)loadWebsite:(NSString *)website
{
    [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:website]]];
}


@end
