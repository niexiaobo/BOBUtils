//
//  NSMutableDictionary+BOBs.m
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import "NSMutableDictionary+BOBs.h"

@implementation NSMutableDictionary (BOBs)

#pragma mark - 替换 setObject: forKey:
- (void)addObject:(NSObject *)anObject forKey:(NSString*)aKey {
    //如果不为空则添加
    if ((anObject != nil) && ![anObject isEqual:[NSNull null]] && (aKey != nil) && ![aKey isEqual:[NSNull null]] && [aKey  isKindOfClass:[NSString class]]) {
        
        [self setObject:anObject forKey:aKey];
        
    }
}

@end
