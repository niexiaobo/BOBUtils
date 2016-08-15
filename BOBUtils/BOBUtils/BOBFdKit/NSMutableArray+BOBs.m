//
//  NSMutableArray+BOBs.m
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import "NSMutableArray+BOBs.h"

@implementation NSMutableArray (BOBs)
- (id)safeObjectAtIndex:(NSUInteger)index
{
    if([self count] > 0)
        return [self objectAtIndex:index];
    else
        return nil;
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
- (id)objectAtIndex:(NSUInteger)index{
    if ([self isKindOfClass:[NSArray class]]) {
        return nil;
    }else if ([self isKindOfClass:[NSMutableArray class]]) {
        
        if([self count] <= 0){
            return nil;
        }else if([self count] <= index){
            return nil;
        }else{
            
            return [self objectAtIndex:index];
            
        }
    }
    
    return nil;
}

#pragma mark- 替换objectAtIndex
- (id)objectAtIndex_NXB:(NSUInteger)index{
    
    
    if ([self isKindOfClass:[NSArray class]]) {
        return nil;
    }else if ([self isKindOfClass:[NSMutableArray class]]) {
        
        if([self count] <= 0){
            return nil;
        }else if([self count] <= index){
            return nil;
        }else{
            
            return [self objectAtIndex:index];
            
        }
    }
    
    return nil;
}




- (void)addObject_safe:(id)Object{
    
    if ((self!=nil) & [self isKindOfClass:[NSMutableArray class]]) {
        [self addObject:Object];
        
    }else if ((self!=nil) & [self isKindOfClass:[NSArray class]]) {
        [self mutableCopy];
        
        
        
    }
    
}
- (void)addObjectsFromArray_safe:(NSArray *)Array{
    
    if ((self!=nil) & [self isKindOfClass:[NSMutableArray class]]) {
        [self addObjectsFromArray:Array];
        
    }
    
    
    
}




- (void)moveObjectFromIndex:(NSUInteger)from toIndex:(NSUInteger)to
{
    if(to != from)
    {
        id obj = [self safeObjectAtIndex:from];
        [self removeObjectAtIndex:from];
        
        if(to >= [self count])
            [self addObject:obj];
        else
            [self insertObject:obj atIndex:to];
    }
}

- (NSMutableArray *)reversedArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    
    for(id element in enumerator) [array addObject:element];
    
    return array;
}

+ (NSMutableArray *)sortArrayByKey:(NSString *)key array:(NSMutableArray *)array ascending:(BOOL)ascending
{
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    [tempArray removeAllObjects];
    [tempArray addObjectsFromArray:array];
    
    NSSortDescriptor *brandDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:ascending];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:brandDescriptor, nil];
    NSArray *sortedArray = [tempArray sortedArrayUsingDescriptors:sortDescriptors];
    [tempArray removeAllObjects];
    tempArray = (NSMutableArray *)sortedArray;
    [array removeAllObjects];
    [array addObjectsFromArray:tempArray];
    
    return array;
}



#pragma mark- 屏蔽字典方法
- (id)objectForKey:(id)aKey{
#ifdef DEBUG
    NSAssert(NO, @"NSMutableArray can not  objectForKey");
#endif
    
    return nil;
    
}
-(void)setObject:(id)anObject forKey:(id<NSCopying>)aKey{
#ifdef DEBUG
    NSAssert(NO, @"NSMutableArray can not setObject objectForKey");
#endif
}
- (void)removeObjectForKey:(id)aKey{
#ifdef DEBUG
    NSAssert(NO, @"NSMutableArray can not  removeObjectForKey");
#endif
}


@end
