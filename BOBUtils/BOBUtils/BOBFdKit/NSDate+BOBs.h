//
//  NSDate+BOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  The simplified date structure
 */
struct BFDateInformation {
    NSInteger day;
    NSInteger month;
    NSInteger year;
    
    NSInteger weekday;
    
    NSInteger minute;
    NSInteger hour;
    NSInteger second;
    
};
typedef struct BFDateInformation BFDateInformation;

@interface NSDate (BOBs)

+ (NSDate *)yesterday;

#pragma mark - 当前时间
+ (double)getCurrentDate;

+ (NSDate *)month;

- (NSDate *)month;

- (NSInteger)weekday;

- (NSString *)dayFromWeekday;

- (BOOL)isSameDay:(NSDate *)anotherDate;

- (NSInteger)monthsBetweenDate:(NSDate *)toDate;

- (NSInteger)daysBetweenDate:(NSDate *)toDate;

- (BOOL)isToday;

- (NSDate *)dateByAddingDays:(NSUInteger)days;

+ (NSDate *)dateWithDatePart:(NSDate *)aDate
                 andTimePart:(NSDate *)aTime;

- (NSString *)monthString;

- (NSString *)yearString;

+ (NSString *)monthStringWithMonthNumber:(NSInteger)month;


- (BFDateInformation)dateInformation;

- (BFDateInformation)dateInformationWithTimeZone:(NSTimeZone *)timezone;

+ (NSDate *)dateFromDateInformation:(BFDateInformation)info;

+ (NSDate *)dateFromDateInformation:(BFDateInformation)info
                           timeZone:(NSTimeZone *)timezone;

/**
 *  @return Return a NSString in the following format:
 *  D/M/Y H:M:S  Example: 15/10/2013 10:38:43
 */
+ (NSString *)dateInformationDescriptionWithInformation:(BFDateInformation)info;

@end
