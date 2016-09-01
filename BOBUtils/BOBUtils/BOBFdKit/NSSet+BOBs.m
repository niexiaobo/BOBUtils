//
//  NSSet+BOBs.m
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/9/1.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import "NSSet+BOBs.h"

@implementation NSSet (BOBs)

#pragma mark - 去重，乱序(NSSet 一般会导致乱序)
+ (NSArray *)DeduplicationWithArray:(NSArray *)dataArray {
    if (!dataArray) {
        return @[];
    }
    NSSet *sortSet = [NSSet setWithArray:dataArray];
    return [sortSet allObjects];
}

#pragma mark - 去重，乱序(NSSet 一般会导致乱序)
+ (NSArray *)DedupliSortByArray:(NSArray *)dataArray {
    if (!dataArray) {
        return @[];
    }
    NSSet *sortSet = [NSSet setWithArray:dataArray];
    NSArray *sortDesc = @[[[NSSortDescriptor alloc] initWithKey:nil ascending:YES]];
    NSArray *sortSetArray = [sortSet sortedArrayUsingDescriptors:sortDesc];
    
    return sortSetArray;
}


@end
