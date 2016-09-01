//
//  NSSet+BOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/9/1.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSet (BOBs)
#pragma mark - 去重，乱序(NSSet 一般会导致乱序)
+ (NSArray *)DeduplicationWithArray:(NSArray *)dataArray;
#pragma mark - 去重，乱序(NSSet 一般会导致乱序)
+ (NSArray *)DedupliSortByArray:(NSArray *)dataArray;
@end
