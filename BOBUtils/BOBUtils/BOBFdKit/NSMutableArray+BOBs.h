//
//  NSMutableArray+BOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (BOBs)
#if DEBUG

#else

#pragma mark- 屏蔽字典方法
- (id)objectForKey:(id)aKey;
-(void)setObject:(id)anObject forKey:(id<NSCopying>)aKey;
- (void)removeObjectForKey:(id)aKey;

#endif

- (id)safeObjectAtIndex:(NSUInteger)index;
- (id)objectAtIndex:(NSUInteger)index;
- (id)objectAtIndex_NXB:(NSUInteger)index;

#pragma mark- add 2015 聂小波
- (id)objectAtIndex_safe_Str:(NSUInteger)index;
- (id)objectAtIndex_safe_int:(NSUInteger)index;

- (void)addObject_safe:(id)Object;
- (void)addObjectsFromArray_safe:(NSArray *)Array;


- (void)moveObjectFromIndex:(NSUInteger)from
                    toIndex:(NSUInteger)to;

- (NSMutableArray *)reversedArray;

+ (NSMutableArray *)sortArrayByKey:(NSString *)key
                             array:(NSMutableArray *)array
                         ascending:(BOOL)ascending;

@end
