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


- (NSArray *)reversedArray;

- (NSString *)arrayToJson;

+ (NSString *)arrayToJson:(NSArray *)array;

+ (NSArray *)reversedArray:(NSArray *)array;


@end
