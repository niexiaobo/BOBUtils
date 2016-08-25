//
//  NSMutableDictionary+BOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (BOBs)

#pragma mark - 替换 setObject: forKey: （对传入值 判空，避免崩溃）
- (void)addObject:(NSObject *)anObject forKey:(NSString*)aKey;

@end
