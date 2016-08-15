//
//  UIImage+BOBs.m
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import "UIImage+BOBs.h"
#import <objc/runtime.h>
@implementation UIImage (BOBs)
+ (void)exchangeClassMethod:(SEL)selector1 withMethod:(SEL)selector2
{
    Method fromMethod = class_getClassMethod(self, selector1);
    Method toMethod = class_getClassMethod(self, selector2);
    method_exchangeImplementations(fromMethod, toMethod);
}

- (UIImage *)blendOverlay
{
    UIGraphicsBeginImageContext(CGSizeMake(self.size.width, self.size.height));
    [self drawInRect:CGRectMake(0.0, 0.0, self.size.width, self.size.height) blendMode:kCGBlendModeOverlay alpha:1];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
