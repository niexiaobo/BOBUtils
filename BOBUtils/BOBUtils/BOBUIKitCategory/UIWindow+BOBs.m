//
//  UIWindow+BOBs.m
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import "UIWindow+BOBs.h"

@implementation UIWindow (BOBs)

- (UIImage *)takeScreenshot
{
    BOOL ignoreOrientation = SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0");
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    CGSize imageSize = CGSizeZero;
    if (UIInterfaceOrientationIsPortrait(orientation) || ignoreOrientation)
        imageSize = [UIScreen mainScreen].bounds.size;
    else
        imageSize = CGSizeMake([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, self.center.x, self.center.y);
    CGContextConcatCTM(context, self.transform);
    CGContextTranslateCTM(context, -self.bounds.size.width * self.layer.anchorPoint.x, -self.bounds.size.height * self.layer.anchorPoint.y);
    
    // Correct for the screen orientation
    if(!ignoreOrientation)
    {
        if(orientation == UIInterfaceOrientationLandscapeLeft)
        {
            CGContextRotateCTM(context, (CGFloat)M_PI_2);
            CGContextTranslateCTM(context, 0, -imageSize.width);
        }
        else if(orientation == UIInterfaceOrientationLandscapeRight)
        {
            CGContextRotateCTM(context, (CGFloat)-M_PI_2);
            CGContextTranslateCTM(context, -imageSize.height, 0);
        }
        else if(orientation == UIInterfaceOrientationPortraitUpsideDown)
        {
            CGContextRotateCTM(context, (CGFloat)M_PI);
            CGContextTranslateCTM(context, -imageSize.width, -imageSize.height);
        }
    }
    
    if([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    else
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    CGContextRestoreGState(context);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
