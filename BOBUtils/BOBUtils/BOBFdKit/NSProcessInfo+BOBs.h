//
//  NSProcessInfo+BOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSProcessInfo (BOBs)

/**
 *  Return the CPU usage
 *
 *  @return Return the CPU usage
 */
+ (float)cpuUsage;
@end
