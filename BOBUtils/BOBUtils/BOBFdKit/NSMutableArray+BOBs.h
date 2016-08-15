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

/**
 *  Move an object from an index to another
 *
 *  @param from The index to move from
 *  @param to   The index to move to
 */
- (void)moveObjectFromIndex:(NSUInteger)from
                    toIndex:(NSUInteger)to;

/**
 *  Create a reversed array from self
 *
 *  @return Return the reversed array
 */
- (NSMutableArray *)reversedArray;

/**
 *  Sort an array by a given key with option for ascending or descending
 *
 *  @param key       The key to order the array
 *  @param array     The array to be ordered
 *  @param ascending A BOOL to choose if ascending or descending
 *
 *  @return Return the given array ordered by the given key ascending or descending
 */
+ (NSMutableArray *)sortArrayByKey:(NSString *)key
                             array:(NSMutableArray *)array
                         ascending:(BOOL)ascending;

@end
