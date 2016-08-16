//
//  UIImageView+BOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (BOBs)

+ (id)initWithImage:(UIImage *)image
              frame:(CGRect)rect;

+ (id)initWithImage:(UIImage *)image
               size:(CGSize)size
             center:(CGPoint)center;
@end
