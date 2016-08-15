//
//  UIImageView+BOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (BOBs)
/**
 *  Create an UIImageView with the given image and frame
 *
 *  @param image UIImageView image
 *  @param rect  UIImageView frame
 *
 *  @return Return the created UIImageView
 */
+ (id)initWithImage:(UIImage *)image
              frame:(CGRect)rect;

/**
 *  Create an UIImageView with the given image, size and center
 *
 *  @param image  UIImageView image
 *  @param size   UIImageView size
 *  @param center UIImageView center
 *
 *  @return Return the created UIImageView
 */
+ (id)initWithImage:(UIImage *)image
               size:(CGSize)size
             center:(CGPoint)center;
@end
