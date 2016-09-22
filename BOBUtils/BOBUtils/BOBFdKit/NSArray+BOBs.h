//
//  NSArray+BOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
typedef NS_ENUM(NSInteger, SequenceType)
{
    OrderedAscending = 0,
    OrderedDescending = 1,
    OrderedSame = 2
};

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

#pragma mark - 去重，不乱序,不排序
- (NSArray *)numberSortByArray;
#pragma mark - 去重，不乱序,不排序 - 2
- (NSArray *)numberSortByArray2;
#pragma mark - 去重，数字大小 排序
- (NSArray *)numberArrayDeduplBySortType:(SequenceType)sortType;
#pragma mark - 不去重，数字大小 排序
- (NSArray *)numberArrayBySortType:(SequenceType)sortType;
#pragma mark - 去重，字符从前往后一个一个对比 排序（字母数字混合）
- (NSArray *)stringNumberArrayBySortType:(SequenceType)sortType;


@end
