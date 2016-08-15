//
//  NSArray+BOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (BOBs)
- (id)safeObjectAtIndex:(NSUInteger)index;

#pragma mark- add 2015 聂小波
#if DEBUG

#else



- (id)addObject:(id)anObject;

- (id)insertObject:(id)anObject atIndex:(NSUInteger)index;
- (id)removeLastObject;
- (id)removeObjectAtIndex:(NSUInteger)index;
- (id)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
- (id)addObjectsFromArray:(NSArray*)otherArray;
#pragma mark- 屏蔽字典方法
- (id)objectForKey:(id)aKey;
-(void)setObject:(id)anObject forKey:(id<NSCopying>)aKey;
- (void)removeObjectForKey:(id)aKey;


#endif




- (id)objectAtIndex_safe_Str:(NSUInteger)index;
- (id)objectAtIndex_safe_int:(NSUInteger)index;

- (id)objectAtIndex_NXB:(NSUInteger)index;



/**
 *  Create a reversed array from self
 *
 *  @return Return the reversed array
 */
- (NSArray *)reversedArray;

/**
 *  Convert self to JSON as NSString
 *
 *  @return Return the JSON as NSString or nil if error while parsing
 */

- (NSString *)arrayToJson;

/**
 *  Create a reversed array from the given array
 *
 *  @param array The array to be converted
 *
 *  @return Return the reversed array
 */

+ (NSString *)arrayToJson:(NSArray *)array;


/**
 *  Convert the given array to JSON as NSString
 *
 *  @param array The array to be reversed
 *
 *  @return Return the JSON as NSString or nil if error while parsing
 */

+ (NSArray *)reversedArray:(NSArray *)array;
@end
