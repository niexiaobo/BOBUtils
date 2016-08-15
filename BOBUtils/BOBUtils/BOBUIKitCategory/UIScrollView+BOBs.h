//
//  UIScrollView+BOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (BOBs)
+ (UIScrollView *)initWithFrame:(CGRect)frame
                    contentSize:(CGSize)contentSize
                  clipsToBounds:(BOOL)clipsToBounds
                  pagingEnabled:(BOOL)pagingEnabled
           showScrollIndicators:(BOOL)showScrollIndicators
                       delegate:(id<UIScrollViewDelegate>)delegate;
@end
