//
//  NSDate+BOBs.m
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import "NSDate+BOBs.h"

@implementation NSDate (BOBs)
+ (NSDate *)yesterday
{
    BFDateInformation inf = [[NSDate date] dateInformation];
    inf.day--;
    return [self dateFromDateInformation:inf];
}

#pragma mark - 当前时间
+ (double)getCurrentDate {
    NSDate *dateNow = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger year;         //年
    NSInteger month;        //月
    NSInteger day;          //日
    NSInteger hour;         //时
    NSInteger minute;       //分
    NSInteger second;       //秒
    NSInteger nanosecond;   //10^-9秒
    
    [calendar getHour:&hour minute:&minute second:&second nanosecond:&nanosecond fromDate:dateNow];
    
    [calendar getEra:nil year:&year month:&month day:&day fromDate:dateNow];
    
    NSLog(@"%.ld-%.ld-%.ld %.ld:%02ld:%02ld.%03ld", year, month, day, hour, minute, second, nanosecond/1000000);
    
    NSString *cuurentTime = [NSString stringWithFormat:@"%04ld%02ld%02ld%02ld%02ld",year, month, day, hour, minute];
    return [cuurentTime doubleValue];
}

+ (NSDate *)month
{
    return [[NSDate date] month];
}

- (NSDate *)month
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [gregorian components:(NSCalendarUnitYear | NSCalendarUnitMonth) fromDate:self];
    [comp setDay:1];
    NSDate *date = [gregorian dateFromComponents:comp];
    return date;
}

- (NSInteger)weekday
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday) fromDate:self];
    NSInteger weekday = [comps weekday];
    return weekday;
}

- (NSString *)dayFromWeekday
{
    switch([self weekday])
    {
        case 1:
            return NSLocalizedStringFromTable(@"SUNDAY", @"BFKit", @"");
            break;
        case 2:
            return NSLocalizedStringFromTable(@"MONDAY", @"BFKit", @"");
            break;
        case 3:
            return NSLocalizedStringFromTable(@"TUERSDAY", @"BFKit", @"");
            break;
        case 4:
            return NSLocalizedStringFromTable(@"WEDNESDAY", @"BFKit", @"");
            break;
        case 5:
            return NSLocalizedStringFromTable(@"THURSDAY", @"BFKit", @"");
            break;
        case 6:
            return NSLocalizedStringFromTable(@"FRIDAY", @"BFKit", @"");
            break;
        case 7:
            return NSLocalizedStringFromTable(@"SATURDAY", @"BFKit", @"");
            break;
        default:
            break;
    }
    
    return @"";
}

- (NSDate *)timelessDate
{
    NSDate *day = self;
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [gregorian components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:day];
    return [gregorian dateFromComponents:comp];
}

- (NSDate *)monthlessDate
{
    NSDate *day = self;
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [gregorian components:(NSCalendarUnitYear | NSCalendarUnitMonth) fromDate:day];
    return [gregorian dateFromComponents:comp];
}

- (BOOL)isSameDay:(NSDate *)anotherDate
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components1 = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    NSDateComponents* components2 = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:anotherDate];
    return ([components1 year] == [components2 year] && [components1 month] == [components2 month] && [components1 day] == [components2 day]);
}

- (NSInteger)monthsBetweenDate:(NSDate *)toDate
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *components = [gregorian components:NSCalendarUnitMonth
                                                fromDate:[self monthlessDate]
                                                  toDate:[toDate monthlessDate]
                                                 options:0];
    NSInteger months = [components month];
    return abs((int)months);
}

- (NSInteger)daysBetweenDate:(NSDate *)toDate
{
    NSTimeInterval time = [self timeIntervalSinceDate:toDate];
    return abs(time / 60 / 60 / 24);
}

- (BOOL)isToday
{
    return [self isSameDay:[NSDate date]];
}

- (NSDate *)dateByAddingDays:(NSUInteger)days
{
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.day = days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:c toDate:self options:0];
}

+ (NSDate *)dateWithDatePart:(NSDate *)aDate andTimePart:(NSDate *)aTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    NSString *datePortion = [dateFormatter stringFromDate:aDate];
    
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *timePortion = [dateFormatter stringFromDate:aTime];
    
    [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    NSString *dateTime = [NSString stringWithFormat:@"%@ %@",datePortion,timePortion];
    return [dateFormatter dateFromString:dateTime];
}

- (NSString *)monthString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMMM"];
    return [dateFormatter stringFromDate:self];
}

+ (NSString *)monthStringWithMonthNumber:(NSInteger)month
{
    switch(month)
    {
        case 1:
            return NSLocalizedStringFromTable(@"JANUARY", @"BFKit", @"");
            break;
        case 2:
            return NSLocalizedStringFromTable(@"FEBRUARY", @"BFKit", @"");
            break;
        case 3:
            return NSLocalizedStringFromTable(@"MARCH", @"BFKit", @"");
            break;
        case 4:
            return NSLocalizedStringFromTable(@"APRIL", @"BFKit", @"");
            break;
        case 5:
            return NSLocalizedStringFromTable(@"MAY", @"BFKit", @"");
            break;
        case 6:
            return NSLocalizedStringFromTable(@"JUNE", @"BFKit", @"");
            break;
        case 7:
            return NSLocalizedStringFromTable(@"JULY", @"BFKit", @"");
            break;
        case 8:
            return NSLocalizedStringFromTable(@"AUGUST", @"BFKit", @"");
            break;
        case 9:
            return NSLocalizedStringFromTable(@"SEPTEMBER", @"BFKit", @"");
            break;
        case 10:
            return NSLocalizedStringFromTable(@"OCTOBER", @"BFKit", @"");
            break;
        case 11:
            return NSLocalizedStringFromTable(@"NOVEMBER", @"BFKit", @"");
            break;
        case 12:
            return NSLocalizedStringFromTable(@"DECEMBER", @"BFKit", @"");
            break;
        default:
            return nil;
            break;
    }
}

- (NSString *)yearString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy"];
    return [dateFormatter stringFromDate:self];
}

- (BFDateInformation)dateInformationWithTimeZone:(NSTimeZone *)timezone
{
    BFDateInformation info;
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [gregorian setTimeZone:timezone];
    NSDateComponents *comp = [gregorian components:(NSCalendarUnitMonth | NSCalendarUnitMinute | NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitSecond) fromDate:self];
    info.day = [comp day];
    info.month = [comp month];
    info.year = [comp year];
    
    info.hour = [comp hour];
    info.minute = [comp minute];
    info.second = [comp second];
    
    
    info.weekday = [comp weekday];
    
    return info;
}

- (BFDateInformation)dateInformation
{
    BFDateInformation info;
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [gregorian components:(NSCalendarUnitMonth | NSCalendarUnitMinute | NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitSecond) fromDate:self];
    info.day = [comp day];
    info.month = [comp month];
    info.year = [comp year];
    
    info.hour = [comp hour];
    info.minute = [comp minute];
    info.second = [comp second];
    
    info.weekday = [comp weekday];
    
    return info;
}

+ (NSDate *)dateFromDateInformation:(BFDateInformation)info timeZone:(NSTimeZone *)timezone
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [gregorian setTimeZone:timezone];
    NSDateComponents *comp = [gregorian components:(NSCalendarUnitYear | NSCalendarUnitMonth) fromDate:[NSDate date]];
    
    [comp setDay:info.day];
    [comp setMonth:info.month];
    [comp setYear:info.year];
    [comp setHour:info.hour];
    [comp setMinute:info.minute];
    [comp setSecond:info.second];
    [comp setTimeZone:timezone];
    
    return [gregorian dateFromComponents:comp];
}

+ (NSDate *)dateFromDateInformation:(BFDateInformation)info
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [gregorian components:(NSCalendarUnitYear | NSCalendarUnitMonth) fromDate:[NSDate date]];
    
    [comp setDay:info.day];
    [comp setMonth:info.month];
    [comp setYear:info.year];
    [comp setHour:info.hour];
    [comp setMinute:info.minute];
    [comp setSecond:info.second];
    //[comp setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    return [gregorian dateFromComponents:comp];
}

+ (NSString *)dateInformationDescriptionWithInformation:(BFDateInformation)info
{
    return [NSString stringWithFormat:@"%02li/%02li/%04li %02li:%02li:%02li", (long)info.month, (long)info.day, (long)info.year, (long)info.hour, (long)info.minute, (long)info.second];
}

@end
