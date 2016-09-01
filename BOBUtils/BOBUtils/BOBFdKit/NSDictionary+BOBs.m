//
//  NSDictionary+BOBs.m
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import "NSDictionary+BOBs.h"

@implementation NSDictionary (BOBs)
- (NSArray *)keyArray {
    if (self) {
        return [self allKeys];
    }
    return @[];
}

- (NSArray *)valuesArray {
    if (self) {
        return [self allValues];
    }
    return @[];
}

@end
