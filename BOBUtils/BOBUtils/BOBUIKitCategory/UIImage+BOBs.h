//
//  UIImage+BOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>
#import <Accelerate/Accelerate.h>

@interface UIImage (BOBs)

- (UIImage *)blendOverlay;

- (UIImage *)maskWithImage:(UIImage *)image
                   andSize:(CGSize)size;

- (UIImage *)maskWithImage:(UIImage *)image;

- (UIImage *)imageAtRect:(CGRect)rect;

- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;

- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;

- (UIImage *)imageByScalingProportionallyToMaximumSize:(CGSize)targetSize;

- (UIImage *)imageByScalingToSize:(CGSize)targetSize;

- (UIImage *)imageRotatedByRadians:(CGFloat)radians;

- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

- (BOOL)hasAlpha;

- (UIImage *)removeAlpha;

- (UIImage *)fillAlpha;

- (UIImage *)fillAlphaWithColor:(UIColor *)color;

- (BOOL)isGrayscale;

- (UIImage *)imageToGrayscale;

- (UIImage *)imageToBlackAndWhite;

- (UIImage *)invertColors;

- (UIImage *)bloom:(float)radius
         intensity:(float)intensity;

- (UIImage *)boxBlurImageWithBlur:(CGFloat)blur;

- (UIImage *)bumpDistortion:(CIVector *)center
                     radius:(float)radius
                      scale:(float)scale;

- (UIImage *)bumpDistortionLinear:(CIVector *)center
                           radius:(float)radius
                            angle:(float)angle
                            scale:(float)scale;

- (UIImage *)circleSplashDistortion:(CIVector *)center
                             radius:(float)radius;

- (UIImage *)circularWrap:(CIVector *)center
                   radius:(float)radius
                    angle:(float)angle;

- (UIImage *)cmykHalftone:(CIVector *)center
                    width:(float)width
                    angle:(float)angle
                sharpness:(float)sharpness
                      gcr:(float)gcr
                      ucr:(float)ucr;

- (UIImage *)sepiaToneWithIntensity:(float)intensity;

+ (UIImage *)imageWithColor:(UIColor *)color;


@end
