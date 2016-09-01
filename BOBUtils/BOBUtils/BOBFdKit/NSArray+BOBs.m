//
//  NSArray+BOBs.m
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import "NSArray+BOBs.h"

@implementation NSArray (BOBs)
- (id)safeObjectAtIndex:(NSUInteger)index
{
    if([self count] > 0) return [self objectAtIndex:index];
    else return nil;
}



#pragma mark- add 2015 聂小波
- (id)objectAtIndex_safe_Str:(NSUInteger)index{
    if([self count] <= 0){
        return @"";
    }else if([self count] <= index){
        return @"";
    }else{
        
        return [self objectAtIndex:index];
        
    }
    
}


- (id)objectAtIndex_safe_int:(NSUInteger)index{
    
    if([self count] <= 0){
        return 0;
    }else if([self count] <= index){
        return 0;
    }else{
        
        return [self objectAtIndex:index];
        
    }
    
}

#pragma mark- 替换objectAtIndex
- (id)objectAtIndex_NXB:(NSUInteger)index{
    
    if([self count] <= 0){
#ifdef DEBUG
        NSAssert(NO, @"index %lu > count %lu", (unsigned long)index, (unsigned long)self.count);
#endif
        return nil;
    }else if([self count] <= index){
#ifdef DEBUG
        NSAssert(NO, @"index %lu > count %lu", (unsigned long)index, (unsigned long)self.count);
#endif
        return nil;
    }else{
        return [self objectAtIndex:index];
    }
}

#pragma mark- 真机环境：禁止调用NSMutableArray 方法
- (id)addObject:(id)anObject{
    
#ifdef DEBUG
    NSAssert(NO, @"NSarray can not  addObject");
#endif
    if (anObject) {
        NSMutableArray *temp=[self mutableCopy];
        [temp addObject:anObject];
        return  temp;
    }
    
    return self;
    
    
    
}
- (id)insertObject:(id)anObject atIndex:(NSUInteger)index{
#ifdef DEBUG
    NSAssert(NO, @"NSarray can not  insertObject");
#endif
    if (!anObject) {
        return self;
    }
    
    if ((int)index<0) {
        return self;
    }
    
    
    NSMutableArray *temp=[self mutableCopy];
    if (index <temp.count & anObject!=nil) {
        [temp insertObject:anObject atIndex:index];
    }
    
    return  temp;
    
}
- (id)removeLastObject{
#ifdef DEBUG
    NSAssert(NO, @"NSarray can not  removeLastObject");
#endif
    
    NSMutableArray *temp=[self mutableCopy];
    if (temp.count>0) {
        [temp removeLastObject];
    }
    
    return  [temp copy];
    
    
}
- (id)removeObjectAtIndex:(NSUInteger)index{
#ifdef DEBUG
    NSAssert(NO, @"NSarray can not  removeObjectAtIndex");
#endif
    
    if ((int)index<0) {
        return self;
    }
    
    
    NSMutableArray *temp=[self mutableCopy];
    if (index <temp.count) {
        [temp removeObjectAtIndex:index];
    }
    
    return  temp;
    
    
    
    
}
- (id)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject{
#ifdef DEBUG
    NSAssert(NO, @"NSarray can not  replaceObjectAtIndex");
#endif
    
    if (!anObject) {
        return self;
    }
    
    if ((int)index<0) {
        return self;
    }
    
    
    NSMutableArray *temp=[self mutableCopy];
    if (index <temp.count & anObject!=nil) {
        [temp replaceObjectAtIndex:index withObject:anObject];
    }
    
    return  [temp copy];
    
}
- (id)addObjectsFromArray:(NSArray*)otherArray{
#ifdef DEBUG
    NSAssert(NO, @"NSarray can not  addObjectsFromArray");
#endif
    
    NSMutableArray *temp=[self mutableCopy];
    if (otherArray!=nil) {
        [temp addObjectsFromArray:otherArray];
        return  temp;
    }
    
    return self;
    
    
}



#pragma mark- 屏蔽字典方法
- (id)objectForKey:(id)aKey{
#ifdef DEBUG
    NSAssert(NO, @"NSarray can not  objectForKey");
#endif
    
    return nil;
    
}
-(void)setObject:(id)anObject forKey:(id<NSCopying>)aKey{
#ifdef DEBUG
    NSAssert(NO, @"NSarray can not setObject objectForKey");
#endif
}
- (void)removeObjectForKey:(id)aKey{
#ifdef DEBUG
    NSAssert(NO, @"NSarray can not  removeObjectForKey");
#endif
}




////////////////////////



- (NSArray *)reversedArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    
    for(id element in enumerator) [array addObject:element];
    
    return array;
}

- (NSString *)arrayToJson
{
    NSString *json = nil;
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
    if(!error)
    {
        json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        return json;
    }
    else
        return nil;
}

+ (NSString *)arrayToJson:(NSArray*)array
{
    NSString *json = nil;
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:array options:0 error:&error];
    if(!error)
    {
        json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        return json;
    }
    else
        return nil;
}

+ (NSArray *)reversedArray:(NSArray*)array
{
    NSMutableArray *arrayTemp = [NSMutableArray arrayWithCapacity:[array count]];
    NSEnumerator *enumerator = [array reverseObjectEnumerator];
    
    for(id element in enumerator) [arrayTemp addObject:element];
    
    return array;
}

#pragma mark - 去重，不乱序,不排序 - 2
/*
 NSArray *arr = @[@111,@222,@111,@333];
 返回：@[@111,@222,@333];
 */
- (NSArray *)numberSortByArray2 {
    if (!self) {
        return @[];
    }
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (NSNumber *number in self) {
        [dict setObject:number forKey:number];
    }
//    NSLog(@"%@",[dict allValues]);
    return [dict allValues];
}

#pragma mark - 去重，不乱序,不排序
- (NSArray *)numberSortByArray {
    if (!self) {
        return @[];
    }
    NSMutableArray *categoryArray = [[NSMutableArray alloc] init];
    for (unsigned i = 0; i < [self count]; i++){
        if ([categoryArray containsObject:[self objectAtIndex:i]] == NO){
            [categoryArray addObject:[self objectAtIndex:i]];
        }
    }
    return categoryArray;
}

#pragma mark - 去重，数字大小 排序
/*
 NSArray *arr = @[@111,@222,@111,@333];
 返回：@[@111,@222,@333];
 */
- (NSArray *)numberArrayDeduplBySortType:(SequenceType)sortType {
    NSArray *sortArray = [self numberSortByArray];
    sortArray = [self numberArrayBySortType:sortType];
    
    return sortArray;
}

#pragma mark - 不去重，数字大小 排序
- (NSArray *)numberArrayBySortType:(SequenceType)sortType {
    NSArray *sortArray = self ? self :@[];
    
    sortArray = [sortArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSNumber *number1 = obj1;
        NSNumber *number2 = obj2;
        
        if ([number1 integerValue] < [number2 integerValue]) {
            
            if (sortType == OrderedAscending) {
                return NSOrderedAscending;
            } else if (sortType == OrderedDescending){
                return NSOrderedDescending;
            }
        } else if ([number1 integerValue] > [number2 integerValue]) {
            
            if (sortType == OrderedAscending) {
                return NSOrderedDescending;
            } else if (sortType == OrderedDescending){
                return NSOrderedAscending;
            }
        }
        return NSOrderedSame;
        
    }];
    
    return sortArray;
}

#pragma mark - 去重，字符从前往后一个一个对比 排序（字母数字混合）
/*
 NSArray *sortArray = @[@"A2",@"A1",@"c3",@"d4",@"b",@"d12"];
 
 return  sortSetArray->( A1, A2, b, c3, d12, d4 )
 */
- (NSArray *)stringNumberArrayBySortType:(SequenceType)sortType {
    if (!self) {
        return @[];
    }
    NSSet *sortSet = [NSSet setWithArray:self];
    if (sortType == OrderedSame) {
        return [sortSet allObjects];
    } else {
        NSArray *sortDesc = @[[[NSSortDescriptor alloc] initWithKey:nil ascending:(sortType == OrderedAscending) ? YES : ((sortType == OrderedAscending) ? NO : YES)]];
        NSArray *sortSetArray = [sortSet sortedArrayUsingDescriptors:sortDesc];
        
        return sortSetArray;
    }
}


@end
