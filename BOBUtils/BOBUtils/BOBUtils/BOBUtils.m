//
//  BOBUtils.m
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import "BOBUtils.h"
#pragma mark 字体颜色

#define TEXT_BASE_COLOR [UIColor colorWithRed:255/255.0 green:58/255.0 blue:49/255.0 alpha:1.0]
#define TEXT_BLUE_COLOR [UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1.0]
#define TEXT_RED_COLOR [UIColor colorWithRed:255/255.0 green:34/255.0 blue:34/255.0 alpha:1.0]
#define TEXT_CHAMPAGNE_COLOR [UIColor colorWithRed:234/255.0 green:187/255.0 blue:0/255.0 alpha:1.0]

@implementation BOBUtils

+ (CGFloat)getHeight:(UIFont *)font withContent:(NSString *)content width:(CGFloat)width {
    CGSize constraintSize = CGSizeMake(width, MAXFLOAT);
    
    CGSize textSize = [content sizeWithFont:font
                          constrainedToSize:constraintSize
                              lineBreakMode:NSLineBreakByWordWrapping];
    
    return textSize.height;
}

+ (CGFloat)getWidth:(UIFont *)font withContent:(NSString *)content height:(CGFloat)height {
    CGSize constraintSize = CGSizeMake(MAXFLOAT, height);
    
    CGSize textSize = [content sizeWithFont:font
                          constrainedToSize:constraintSize
                              lineBreakMode:NSLineBreakByWordWrapping];
    
    return textSize.width;
}

/**
 *获取正在编辑中的编辑框
 */
+ (UIView *)editingTextField:(UIView*) view{
    if( [view isKindOfClass:[UITextField class]] ){
        if( ((UITextField*)view).isEditing ){
            return ((UITextField*)view);
        }else{
            return nil;
        }
    }else if( [view isKindOfClass:[UITextView class]] ){
        if( ((UITextView*)view).isFirstResponder ){
            return ((UITextView*)view);
        }else{
            return nil;
        }
    }
    
    for (UIView *subView in view.subviews) {
        UIView *tf = [self editingTextField:subView];
        
        if (tf != nil) {
            return tf;
        }
    }
    
    return nil;
}

/**
 @method 返回@"yyyy-MM-dd HH:mm"格式
 */

+(NSString *)getFormateDateAndTime:(NSString *)dateStr timeStr:(NSString *)timeStr
{
    NSDateFormatter *dateForm = [[NSDateFormatter alloc] init];
    if (timeStr == nil || [timeStr isEqualToString:@""]) {
        [dateForm setDateFormat: @"yyyyMMdd"];
    }else{
        [dateForm setDateFormat: @"yyyyMMddHHmmss"];
    }
    
    NSDate *date = [dateForm dateFromString:[NSString stringWithFormat:@"%@%@",dateStr,timeStr]];
    
    
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    //    NSDate *date = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@%@",dateStr,timeStr]];
    //
    NSString *result = [dateFormatter stringFromDate:date];
    
    
    
    return result;
}

/**
 @method返回中文几月份
 */
+(NSString *)getFormateDateMouth:(NSString *)dateStr
{
    NSString *strMouth=[[NSString alloc]init];
    NSString *strTemp=[[NSString alloc]init];
    
    NSString *dateContent=[[NSString alloc]init];
    strMouth=dateStr;
    
    strTemp=[strMouth substringWithRange:NSMakeRange(4, 1)];
    if ([strTemp isEqualToString:@"0"]) {
        strMouth=[strMouth substringWithRange:NSMakeRange(5, 1)];
    }else{
        strMouth=[strMouth substringWithRange:NSMakeRange(4, 2)];
        
    }
    
    if([strMouth isEqualToString:@"1"]){
        
        dateContent = @"一月";
        
    }else if ([strMouth isEqualToString:@"2"]){
        dateContent = @"二月";
    }else if ([strMouth isEqualToString:@"3"]){
        dateContent = @"三月";
    }else if ([strMouth isEqualToString:@"4"]){
        dateContent = @"四月";
    }else if ([strMouth isEqualToString:@"5"]){
        dateContent = @"五月";
    }else if ([strMouth isEqualToString:@"6"]){
        dateContent = @"六月";
    }else if ([strMouth isEqualToString:@"7"]){
        dateContent = @"七月";
    }else if ([strMouth isEqualToString:@"8"]){
        dateContent = @"八月";
    }else if ([strMouth isEqualToString:@"9"]){
        dateContent = @"九月";
    }else if ([strMouth isEqualToString:@"10"]){
        dateContent = @"十月";
    }else if ([strMouth isEqualToString:@"11"]){
        dateContent = @"十一月";
    }else if ([strMouth isEqualToString:@"12"]){
        dateContent = @"十二月";
    }
    
    
    return dateContent;
}



/**
 @method
 */
+(NSString *)getFormateDateByHz:(NSString *)dateStr timeStr:(NSString *)timeStr
{
    NSDateFormatter *dateForm = [[NSDateFormatter alloc] init];
    if (timeStr == nil || [timeStr isEqualToString:@""]) {
        [dateForm setDateFormat: @"yyyyMMdd"];
    }else{
        [dateForm setDateFormat: @"yyyyMMddHHmmss"];
    }
    
    NSDate *date = [dateForm dateFromString:[NSString stringWithFormat:@"%@%@",dateStr,timeStr]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    //    NSLog(@"newsDate = %@",newsDate);
    //    NSDate *newsDateFormatted = [dateFormatter dateFromString:newsDate];
    //    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    //    [dateFormatter setTimeZone:timeZone];
    
    //    NSDate* current_date = [[NSDate alloc] init];
    //
    //    NSTimeInterval time=[current_date timeIntervalSinceDate:newsDate];//间隔的秒数
    NSTimeInterval time = fabs([date timeIntervalSinceNow]);//间隔的秒数
    int month=((int)time)/(3600*24*30);
    int days=((int)time)/(3600*24);
    int hours=((int)time)%(3600*24)/3600;
    int minute=((int)time)%(3600*24)/60;
    //    NSLog(@"time=%d",(double)time);
    
    NSString *dateContent;
    
    if(month!=0){
        
        dateContent = [NSString stringWithFormat:@"%@%i%@",@"",month,@"个月前"];
        
    }else if(days!=0){
        
        dateContent = [NSString stringWithFormat:@"%@%i%@",@"",days,@"天前"];
    }else if(hours!=0){
        
        dateContent = [NSString stringWithFormat:@"%@%i%@",@"",hours,@"小时前"];
    }else {
        
        dateContent = [NSString stringWithFormat:@"%@%i%@",@"",minute,@"分钟前"];
    }
    
    return dateContent;
}


/**
 @method
 */
+(NSString *)getFormateDateByNsdate:(NSDate *)date
{
    NSDateFormatter *dateForm = [[NSDateFormatter alloc] init];
    
    [dateForm setDateFormat: @"yyyyMMddHHmmss"];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    //    NSLog(@"newsDate = %@",newsDate);
    //    NSDate *newsDateFormatted = [dateFormatter dateFromString:newsDate];
    //    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    //    [dateFormatter setTimeZone:timeZone];
    
    //    NSDate* current_date = [[NSDate alloc] init];
    //
    //    NSTimeInterval time=[current_date timeIntervalSinceDate:newsDate];//间隔的秒数
    NSTimeInterval time = fabs([date timeIntervalSinceNow]);//间隔的秒数
    int month=((int)time)/(3600*24*30);
    int days=((int)time)/(3600*24);
    int hours=((int)time)%(3600*24)/3600;
    int minute=((int)time)%(3600*24)/60;
    //    NSLog(@"time=%d",(double)time);
    
    NSString *dateContent;
    
    if(month!=0){
        
        dateContent = [NSString stringWithFormat:@"%@%i%@",@"",month,@"个月前"];
        
    }else if(days!=0){
        
        dateContent = [NSString stringWithFormat:@"%@%i%@",@"",days,@"天前"];
    }else if(hours!=0){
        
        dateContent = [NSString stringWithFormat:@"%@%i%@",@"",hours,@"小时前"];
    }else {
        
        dateContent = [NSString stringWithFormat:@"%@%i%@",@"",minute,@"分钟前"];
    }
    
    return dateContent;
}


/**
 @method 根据dateString解析时间（秒）
 @param value 待计算的字符串
 @result NSDate 时间
 */
+(NSDate *)dateFormatterByNSString:(NSString *)dateString
{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    NSDate *date= [dateFormatter dateFromString:dateString];
    
    return date;
}

#pragma mark- 提取数字
+(NSString *)findNumFromStr:(NSString *)textStr
{
    NSString *originalString =textStr;
    
    // Intermediate
    NSMutableString *numberString = [[NSMutableString alloc] init];
    NSString *tempStr;
    NSScanner *scanner = [NSScanner scannerWithString:originalString];
    NSCharacterSet *numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    
    while (![scanner isAtEnd]) {
        // Throw away characters before the first number.
        [scanner scanUpToCharactersFromSet:numbers intoString:NULL];
        
        // Collect numbers.
        [scanner scanCharactersFromSet:numbers intoString:&tempStr];
        if ((tempStr==nil) || [tempStr isEqualToString:@""]) {
            tempStr=@"";
        }
        [numberString appendString:tempStr];
        
        tempStr = @"";
    }
    
    return numberString;
}



#pragma mark- 格式化字符串"2015-12-11 12:13"
+(NSString*)formatDataAndTimeString:(NSString*)date TimeString:(NSString*)Time{
    //创建字符串
    if ([date isEqualToString:@""] ) {
        return @"";
    }
    
    NSString *result = [NSString stringWithFormat:@"%@ %@",date,Time];
    if (result!=nil) {
        NSMutableString *str = [NSMutableString stringWithString:result];
        if (str.length >= 14) {
            //在str第10位插入字符串
            [str insertString:@"-" atIndex:4];
            [str insertString:@"-" atIndex:7];
            [str insertString:@":" atIndex:13];
            [str insertString:@":" atIndex:16];
            
            return  [str substringWithRange:NSMakeRange(0, 16)];
        }
    }
    return result;
}
#pragma mark- 格式化字符串"2015.12.11"
+(NSString*)formatDataAndTimeString2:(NSString*)date{
    //创建字符串
    if ([date isEqualToString:@""]) {
        return @"";
    }
    
    NSString *result = [NSString stringWithFormat:@"%@",date];
    if (result!=nil) {
        NSMutableString *str = [NSMutableString stringWithString:result];
        if (str.length >=8) {
            //
            [str insertString:@"." atIndex:4];
            [str insertString:@"." atIndex:7];
            
            return  str;
        }
    }
    return result;
}
#pragma mark- 格式化字符串"2015年12月11日"
+(NSString*)formatDataAndTimeString3:(NSString*)date{
    //创建字符串
    if ([date isEqualToString:@""]) {
        return @"";
    }
    
    NSString *result = [NSString stringWithFormat:@"%@",date];
    if (result!=nil) {
        NSMutableString *str = [NSMutableString stringWithString:result];
        if (str.length >=8) {
            //
            [str insertString:@"年" atIndex:4];
            [str insertString:@"月" atIndex:7];
            [str appendString:@"日"];
            return  str;
        }
    }
    return result;
}

//返回时间"MM-dd HH:mm
+(NSString *)dateFormatterChartString:(NSDate *)date
{
    NSTimeZone *timeZone = [NSTimeZone timeZoneForSecondsFromGMT:3600*8];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:timeZone];
    //    [formatter setDateFormat:@"MM月dd日 HH:mm"];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSString *dateString = [formatter stringFromDate:date];
    
    
    NSString *dateStr;
    if (dateString==nil) {
        dateStr=@"";
    } else {
        dateStr=[[NSString alloc]initWithFormat:@"%@-%@ %@:%@",[dateString substringWithRange:NSMakeRange(4, 2)],[dateString substringWithRange:NSMakeRange(6, 2)],[dateString substringWithRange:NSMakeRange(8, 2)],[dateString substringWithRange:NSMakeRange(10, 2)]];
    }
    return dateStr;
}
//返回时间"MM-dd HH:mm
+(NSString *)dateFormatterChartStrings:(NSString *)date timeStrings:(NSString *)time
{
    
    NSString *dateString =[NSString stringWithFormat:@"%@%@",date,time];
    
    NSString *dateStr;
    if (dateString==nil) {
        dateStr=@"";
    } else if (date.length<8) {
        return dateString;
    }else if (time.length<6) {
        return dateString;
    }else {
        dateStr=[[NSString alloc]initWithFormat:@"%@-%@ %@:%@",[dateString substringWithRange:NSMakeRange(4, 2)],[dateString substringWithRange:NSMakeRange(6, 2)],[dateString substringWithRange:NSMakeRange(8, 2)],[dateString substringWithRange:NSMakeRange(10, 2)]];
    }
    return dateStr;
}

//返回时间"yyyy-MM-dd
+(NSString *)dateFormatterSString:(NSString *)dateString
{
    
    NSString *dateStr;
    if ([self is_string_null:dateString]) {
        dateStr=@"";
    } else if (dateString.length<8) {
        return dateString;
    }else{
        dateStr=[[NSString alloc]initWithFormat:@"%@-%@-%@",[dateString substringWithRange:NSMakeRange(0, 4)],[dateString substringWithRange:NSMakeRange(4, 2)],[dateString substringWithRange:NSMakeRange(6, 2)]];
    }
    return dateStr;
}
+(NSString *)dateFormatterByNSDate:(NSDate *)date
{
    NSTimeZone *timeZone = [NSTimeZone timeZoneForSecondsFromGMT:3600*8];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:timeZone];
    //    [formatter setDateFormat:@"MM月dd日 HH:mm"];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *result = [formatter stringFromDate:date];
    return result;
};

+(NSDate *)dateFormatterByNSString:(NSString *)dateString andFormatStr:(NSString*)formatStr
{
    //    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[@"1378437276157" longLongValue]];
    if (formatStr == nil || formatStr.length == 0 || dateString == nil || dateString.length ==0) {
        return nil;
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: formatStr];
    NSDate *date= [dateFormatter dateFromString:dateString];
    
    return date;
}

/**
 @method 根据dateString解析时间（秒）
 @param value 待计算的字符串
 @result NSDate 时间
 */
+(NSDate *)dateFormatterByNSStringWithDetail:(NSString *)dateString
{
    //    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[@"1378437276157" longLongValue]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *date= [dateFormatter dateFromString:dateString];
    
    return date;
}
/**
 @method 根据指定日期格式返回档期日期的字符串
 @param 日期格式比如“yyyy-MM-dd”
 @result 字符串日期
 */
+(NSString *)getNowDateWithFormat:(NSString*)format{
    if(format==nil || format.length == 0){
        return  nil;
    }
    NSDate *date=[NSDate date];
    NSDateFormatter *formater=[[NSDateFormatter alloc] init];
    [formater setDateFormat:format];
    //设置当前时区
    //    NSTimeZone *timezone = [NSTimeZone timeZoneWithName:@"GMT"];
    //    [formater setTimeZone:timezone];
    NSString *dateStr=[formater stringFromDate:date];
    return dateStr;
}

/**
 @method 通过Date 获得DateString
 @param 日期格式比如“yyyy-MM-dd”
 @result 字符串日期
 */
+(NSString*)getDateStringByDate:(NSDate*)date andFormatStr:(NSString*)formatStr{
    if (date == nil) {
        return nil;
    }
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:formatStr];
    return [formatter stringFromDate:date];
}
#pragma mark- 判断文本的宽高

+(CGFloat)getHeightSize:(NSString *)str allowSize:(CGFloat)width font:(UIFont *)font{
    CGSize titleSize = [str sizeWithFont:font constrainedToSize:CGSizeMake(width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    
    return titleSize.height;
}
#pragma mark - 自定义类方法
+ (int) compareDate:(NSDate *)todayDate startDate:(NSDate *)startDate{
    NSTimeInterval  today = [todayDate timeIntervalSince1970];
    NSTimeInterval  start = [startDate timeIntervalSince1970];
    return start - today + 24 *60 *60;
}

/**
 @method  获得DateString
 @param timeStr:传入的原时间 formatStr:传入的时间字符串的格式 日期格式比如“yyyy-MM-dd”
 @result 返回友好的日期字符串
 */
+ (NSString*)getFanTimeStr:(NSString*)timeStr andFormatStr:(NSString*)formatStr{
    if (timeStr == nil || timeStr.length == 0) {
        return nil;
    }
    if (formatStr == nil || formatStr.length == 0) {
        formatStr = @"yyyy-MM-dd HH:mm:ss";
    }
    
    NSDate * date = [self dateFormatterByNSString:timeStr andFormatStr:formatStr];
    NSDateComponents * dateComponents =  [[NSCalendar currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSWeekOfMonthCalendarUnit | NSWeekOfYearCalendarUnit fromDate:date];
    
    //    NSLog(@"year(年份): %i", dateComponents.year);
    //    NSLog(@"quarter(季度):%i", dateComponents.quarter);
    //    NSLog(@"month(月份):%i", dateComponents.month);
    //    NSLog(@"day(日期):%i", dateComponents.day);
    //    NSLog(@"hour(小时):%i", dateComponents.hour);
    //    NSLog(@"minute(分钟):%i", dateComponents.minute);
    //    NSLog(@"second(秒):%i", dateComponents.second);
    
    NSDateComponents * dateComponentsTody = [[NSCalendar currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSWeekOfMonthCalendarUnit | NSWeekOfYearCalendarUnit fromDate:[NSDate date]];
    //    NSLog(@"year(年份): %i", dateComponentsTody.year);
    //    NSLog(@"month(月份):%i", dateComponentsTody.month);
    //    NSLog(@"day(日期):%i", dateComponentsTody.day);
    //    NSLog(@"hour(小时):%i", dateComponentsTody.hour);
    //    NSLog(@"minute(分钟):%i", dateComponentsTody.minute);
    //    NSLog(@"second(秒):%i", dateComponentsTody.second);
    
    NSString * fanTimeDetail = @"";
    long hour =dateComponents.hour;
    if(hour>18){
        fanTimeDetail = [NSString stringWithFormat:@"晚上%ld:%02ld", hour-12,dateComponents.minute];
    }else if(hour>13 && hour<=18){
        fanTimeDetail = [NSString stringWithFormat:@"下午%ld:%02ld", hour-12,dateComponents.minute];
    }else if(hour>11 && hour<=13){
        fanTimeDetail = [NSString stringWithFormat:@"中午%ld:%02ld", hour>12?hour-12:hour, dateComponents.minute];
    }else{
        fanTimeDetail = [NSString stringWithFormat:@"上午%ld:%02ld", hour,dateComponents.minute];
    }
    //判断是否 是今年
    if(dateComponents.year == dateComponentsTody.year){
        //判断是否 是今月
        if (dateComponents.month == dateComponentsTody.month) {
            //判断是否 是上午
            NSString * fanDay = @"";
            long dayNum = dateComponentsTody.day - dateComponents.day;
            if (dayNum==0) {
                
            }else if(dayNum ==1){
                fanDay = @"昨天";
            }else if(dayNum == 2){
                fanDay = @"前天";
            }else{
                fanDay =  [NSString stringWithFormat:@"%li日",(long)dateComponents.day ];
            }
            return [[fanDay stringByAppendingString:@" "]stringByAppendingString:fanTimeDetail];
        }else{
            return [NSString stringWithFormat:@"%li月%li日 %@",(long)dateComponents.month, (long)dateComponents.day ,fanTimeDetail];
        }
    }else{
        return [NSString stringWithFormat:@"%li年%li月%li日 %@", (long)dateComponents.year, (long)dateComponents.month, (long)dateComponents.day, fanTimeDetail];
    }
}

/**
 @method 比较两时间 是否相隔大于 seconds 秒
 @param bigTimeStr:大时间 "yyyy-MM-dd HH:mm:ss" samllTimeStr: 小时间"yyyy-MM-dd HH:mm:ss" seconds:相隔时长（秒）
 @result 返回友好的日期字符串
 */
+ (BOOL) isTime:(NSString*)bigTimeStr greatThan:(NSString*)smallTimeStr forSeconds:(long)seconds{
    if (bigTimeStr == nil || bigTimeStr.length ==0) {
        return NO;
    }
    
    if (smallTimeStr == nil || smallTimeStr.length == 0) {
        return NO;
    }
    
    if (seconds <=0) {
        return NO;
    }
    NSDate * bigDate = [self dateFormatterByNSStringWithDetail:bigTimeStr];
    NSDate * smallDate = [self dateFormatterByNSStringWithDetail:smallTimeStr];
    if([bigDate timeIntervalSinceDate:smallDate]<seconds){
        return NO;
    }
    return YES;
}

//+ (NSString *)parseDateStrByDateNum:(int)num{
////    NSInteger oneDay = 24 *60 *60;
////    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[[NSDate date] timeIntervalSince1970]+oneDay*num];
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[[NSDate date] timeIntervalSince1970]];
//
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
////    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
//    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
//    NSString *dateString = [dateFormatter stringFromDate:date];
//    return dateString;
//}
//
//+ (NSDate *)parseDateByDateNum:(int)num{
//    NSInteger oneDay = 24 *60 *60;
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[[NSDate date] timeIntervalSince1970]+oneDay*(num-1)];
////    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[[NSDate date] timeIntervalSince1970]];
//    return date;
//}

+ (NSDate *)parseDateByDateNum:(int)num andDate:(NSDate *)parseDate{
    NSInteger oneDay = 24 *60 *60;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[parseDate timeIntervalSince1970]+oneDay*(num-1)];
    return date;
}

/**
 @method 根据dateString解析时间（毫秒）
 @param value 待计算的字符串
 @result NSDate 时间
 */
+(NSDate *)dateFormatterByNSStringNew:(NSNumber *)dateString
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[dateString longLongValue]/1000];
    return date;
}

+(NSArray *)convertArray:(NSSet *)data orderKey:(NSString *)orderKey{
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:orderKey ascending:YES];
    //    [array sortUsingDescriptors:[NSArray arrayWithObject:sort]]
    NSArray *resultArray =[data sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
    //    return [data allObjects];
    return resultArray;
}

+(void)setImgBounds:(UIView *)img radius:(CGFloat)radius{
    [self setImgBounds:img radius:radius isOpBorders:NO];
}

+(void)setImgBounds:(UIView *)img radius:(CGFloat)radius isOpBorders:(BOOL)isOpBorders{
    
    //myView.layer.contents = (id)[UIImage imageNamed:@"view_BG.png"].CGImage;
    //将图层的边框设置为圆脚
    img.layer.cornerRadius = radius;
    img.layer.masksToBounds = YES;
    //给图层添加一个有色边框
    img.layer.borderWidth = 0.1;
    
    //myView.layer.contents = (id)[UIImage imageNamed:@"view_BG.png"].CGImage;
    //将图层的边框设置为圆脚
    img.layer.cornerRadius = radius;
    img.layer.masksToBounds = YES;
    //给图层添加一个有色边框
    img.layer.borderWidth = 0.1;
    //    img.layer.borderColor = (__bridge CGColorRef)([UIColor whiteColor]);
    if(isOpBorders){
        [img.layer setBorderColor:[[UIColor clearColor] CGColor]];
    }else{
        [img.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    }
    
    //    [img.layer setBorderColor:CFBridgingRetain([UIColor whiteColor])];
    //    img.layer setBorderColor:(CGColorRef)
    //设置layer
    //    CALayer *layer=[img layer];
    //    //是否设置边框以及是否可见
    //    [layer setMasksToBounds:YES];
    //    //设置边框圆角的弧度
    //    [layer setCornerRadius:radius];
    //    //设置边框线的宽
    //    [layer setBorderWidth:2];
    ////    layer set
    //    //设置边框线的颜色
    //    [layer setBorderColor:[[UIColor whiteColor] CGColor]];
    //
    //    img.contentMode = UIViewContentModeScaleAspectFit;
    
    //    img.image = [UIImage createRoundedRectImage:img.image size:img.frame.size radius:radius];   // 设置radius
    
    
}


+(void)setImgBoundsByLittle:(UIView *)img radius:(CGFloat)radius{
    //设置layer
    CALayer *layer=[img layer];
    //是否设置边框以及是否可见
    [layer setMasksToBounds:YES];
    //设置边框圆角的弧度
    [layer setCornerRadius:radius];
    //设置边框线的宽
    [layer setBorderWidth:0.3];
    //    layer set
    //设置边框线的颜色
    //    [layer setBorderColor:[[UIColor colorWithRed:212/255.0 green:212/255.0 blue:212/255.0 alpha:1.0] CGColor]];
    [layer setBorderColor:[[UIColor whiteColor] CGColor]];
}

+(float)getScaleHeightWithScaleWidth:(float)scaleWidth originalWidth:(NSNumber *)originalWidth originalHeight:(NSNumber *)originalHeight{
    int scaleHeight = 0;
    scaleHeight = [originalHeight floatValue]* scaleWidth / [originalWidth floatValue];
    return scaleHeight;
}

+(UIButton *)getBackBtnStyle{
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 20.0, 20.)];
    //    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor darkGrayColor]  forState:UIControlStateHighlighted];
    backBtn.titleLabel.font = [UIFont systemFontOfSize: 16.0];
    return backBtn;
}

/**
 @method 设置btn
 @result UIColor btn样式
 */
+(UIButton *)getBtnStyle:(NSString *)title{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(260.0, 0.0, 80.0, 44.0)];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [btn setTitleColor:TEXT_BASE_COLOR forState:UIControlStateNormal];
    [btn setTitleColor:TEXT_BASE_COLOR forState:UIControlStateHighlighted];
    btn.titleLabel.font = [UIFont systemFontOfSize: 16.0];
    //    [backBtn setBackgroundImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    return btn;
}

+(id)parseJson:(NSData *)data{
    if (!data) {
        return nil;
    }
    NSError *error;
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
}

/**
 *@name 获取文件路径
 */
+(NSString *)getFilePath:(NSString *)fileName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDirectory = [paths objectAtIndex:0];
    NSString *downloadPath = [cachesDirectory stringByAppendingPathComponent:fileName];
    return downloadPath;
}

/**
 *@name 判断网络环境是否是wifi
 */
+(BOOL)isWifi{
    //TODO
    return YES;
}

/**
 *@name dic转化成json
 */
+ (NSString *)dic2Json:(NSDictionary *)dic{
    
    if ([NSJSONSerialization isValidJSONObject:dic]) {
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:dic
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }else
        return nil;
}

/**
 *@name array转化成json
 */
+ (NSString *)array2Json:(NSArray *)array{
    
    if ([NSJSONSerialization isValidJSONObject:array]) {
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:array
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }else
        return nil;
}
/**
 *@name NSMutarray转化成json
 */
+ (NSString *)Mutarray2Json:(NSMutableArray *)array{
    
    if ([NSJSONSerialization isValidJSONObject:array]) {
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:array
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }else
        return nil;
}
/**
 *@name dic转化成data
 */
+ (NSData *)dic2Data:(NSDictionary *)dic{
    
    if ([NSJSONSerialization isValidJSONObject:dic]) {
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:dic
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
        return data;
    }else
        return nil;
}

+(NSString *)setEmptyStr:(NSString *)str{
    if (str == nil) {
        str = @"";
    }
    return str;
}

#pragma mark- 区县地址，分户id
+(NSString *)Hbp_address_ValuesDiction_Hbpkey:(NSString *)Hbpkey{
    NSString *Hbp_address;
    NSDictionary *Hbpaddress=[[NSDictionary alloc]initWithObjectsAndKeys:@"黄浦区",@"01",@"徐汇区",@"04",@"长宁区",@"05",@"静安区",@"06",@"普陀区",@"07",@"闸北区",@"08",@"虹口区",@"09",@"杨浦区",@"10",@"闵行区",@"12",@"宝山区",@"13",@"嘉定区",@"14",@"浦东新区",@"15",@"金山区",@"16",@"松江区",@"17",@"青浦区",@"18",@"奉贤区",@"20",@"崇明县",@"30",nil];
    
    if ([self is_string_not_null:Hbpkey]) {
        Hbp_address=[Hbpaddress objectForKey:Hbpkey];
    }
    
    if (Hbp_address) {
        return Hbp_address;
    }else{
        return @"";
    }
    
    
}
#pragma mark- 区县地址，分户id
+(NSString *)Hbp_ID_ValuesDiction_Hbpkey:(NSString *)Hbpkey{
    NSString *Hbp_address;
    NSDictionary *Hbpaddress=[[NSDictionary alloc]initWithObjectsAndKeys:@"黄浦区",@"01",@"徐汇区",@"04",@"长宁区",@"05",@"静安区",@"06",@"普陀区",@"07",@"闸北区",@"08",@"虹口区",@"09",@"杨浦区",@"10",@"闵行区",@"12",@"宝山区",@"13",@"嘉定区",@"14",@"浦东新区",@"15",@"金山区",@"16",@"松江区",@"17",@"青浦区",@"18",@"奉贤区",@"20",@"崇明县",@"30",nil];
    
    if ([self is_string_not_null:Hbpkey]) {
        Hbp_address=[Hbpaddress objectForKey:Hbpkey];
    }
    
    if (Hbp_address) {
        return Hbp_address;
    }else{
        return @":";
    }
    
    
}
#pragma mark- 报修状态按钮背景
+(NSString *)Repair_image_Diction_key:(NSString *)key{
    NSString *Repair_address;
    NSDictionary *Repairaddress=[[NSDictionary alloc]initWithObjectsAndKeys:@"repairV24",@"A000",@"repairV24",@"000",@"repairV24",@"100",@"repairV24",@"200",@"repairV24",@"300",@"repairV26",@"400",@"repairV24",@"401",@"repairV24",@"500",@"repairV24",@"600",@"repairV26",@"700",@"repairV26",@"701",@"repairV24",@"800",@"repairV24",@"900",nil];
    
    if ([self is_string_not_null:key]) {
        Repair_address=[Repairaddress objectForKey:key];
    }
    
    if (Repair_address) {
        return Repair_address;
    }else{
        return @" ";
    }
    
}


#pragma mark- 报修状态
+(NSString *)Repair_ValuesDiction_key:(NSString *)key{
    NSString *Repair_address;
    NSDictionary *Repairaddress=[[NSDictionary alloc]initWithObjectsAndKeys:@"已发送",@"A000",@"未签收",@"000",@"962121已接收",@"100",@"物业已签收",@"200",@"已派工",@"300",@"已完工",@"400",@"962121已处理",@"401",@"已延期",@"500",@"已关闭",@"600",@"已评价",@"700",@"不予受理",@"701",@"审核退单",@"800",@"注销",@"900",nil];
    
    if ([self is_string_not_null:key]) {
        Repair_address=[Repairaddress objectForKey:key];
    }
    
    if (Repair_address) {
        return Repair_address;
    }else{
        return @" ";
    }
    
}
#pragma mark- 报修状态字典
+(NSDictionary *)Repair_ValuesDiction{
    
    NSDictionary *Repairaddress=[[NSDictionary alloc]initWithObjectsAndKeys:@"未接收",@"000",@"已发送",@"A000",@"962121已接收",@"100",@"物业已签收",@"200",@"已派工",@"300",@"已完工",@"400",@"962121已处理",@"401",@"已延期",@"500",@"已关闭",@"600",@"已评价",@"700",@"不予受理",@"701",@"审核退单",@"800",@"注销",@"900",nil];
    return Repairaddress;
}
#pragma mark- 随手拍状态
+(NSString *)WuyePhoto_ValuesDiction_key:(NSString *)key{
    NSString *Repair_address;
    NSDictionary *Repairaddress=[[NSDictionary alloc]initWithObjectsAndKeys:@"未接收",@"000",@"已发送",@"A000",@"962121已接收",@"100",@"小区经理已接收",@"200",@"已派工",@"300",@"已处理",@"400",@"962121已处理",@"401",@"已延期",@"500",@"已关闭",@"600",@"已评价",@"700",@"不予受理",@"701",@"审核退单",@"800",@"注销",@"900",nil];
    
    if ([self is_string_not_null:key]) {
        Repair_address=[Repairaddress objectForKey:key];
    }
    
    if (Repair_address) {
        return Repair_address;
    }else{
        return @" ";
    }
    
}



#pragma mark- 随手拍状态按钮背景
+(NSString *)WuyePhoto_image_Diction_key:(NSString *)key{
    NSString *Repair_address;
    NSDictionary *Repairaddress=[[NSDictionary alloc]initWithObjectsAndKeys:@"repairV24",@"A000",@"repairV24",@"000",@"repairV24",@"100",@"repairV24",@"200",@"repairV24",@"300",@"repairV26",@"400",@"repairV24",@"401",@"repairV24",@"500",@"repairV24",@"600",@"repairV26",@"700",@"repairV26",@"701",@"repairV24",@"800",@"repairV24",@"900",nil];
    
    if ([self is_string_not_null:key]) {
        Repair_address=[Repairaddress objectForKey:key];
    }
    
    if (Repair_address) {
        return Repair_address;
    }else{
        return @" ";
    }
    
}

#pragma mark- 随手拍状态按钮背景2
+(NSString *)WuyePhoto_state_image_Diction_key:(NSString *)key{
    NSString *Repair_address;
    //3@"表扬",@"4":@"建议",@"1":@"反映问题"
    NSDictionary *Repairaddress=[[NSDictionary alloc]initWithObjectsAndKeys:@"repairV24",@"反映问题",@"repairV25",@"建议",@"repairV26",@"表扬",nil];
    
    if ([self is_string_not_null:key]) {
        Repair_address=[Repairaddress objectForKey:key];
    }
    
    if (Repair_address) {
        return Repair_address;
    }else{
        return @" ";
    }
    
}



#pragma mark- 存储数据－本地缓存
+ (void)saveCache:(int)type andID:(int)_id andObject:(id)Object
{
    NSUserDefaults * setting = [NSUserDefaults standardUserDefaults];
    NSString * key = [NSString stringWithFormat:@"detail-%d-%d",type, _id];
    
    [setting setObject:Object forKey:key];
    [setting synchronize];
    
}

+ (id)getCache:(int)type andID:(int)_id
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    NSString *key = [NSString stringWithFormat:@"detail-%d-%d",type, _id];
    
    id value = [settings objectForKey:key];
    return value;
}

#pragma mark - 设置btn稍后可点击
+ (void)setBtnEnableLater:(UIButton *)sender ctr:(UIViewController *)ctr{
    sender.enabled = NO;
    [ctr performSelector:@selector(setBtnCanEnable:) withObject:sender afterDelay:2];
}

+ (void)setBtnCanEnable:(UIButton *)sender{
    sender.enabled = YES;
}

#pragma mark - 判断是否登录
+ (BOOL)isLoginState{
    NSString *usrStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"LOGIN_USR"];
    if (usrStr) {
        return YES;
    }else{
        return NO;
    }
}

#pragma mark - 判断是否vip
+ (BOOL)isVipState{
    NSString *usrStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"LOGIN_VIP"];
    if (usrStr) {
        return YES;
    }else{
        return NO;
    }
}

#pragma mark - 重新获取skey
+ (void)relogin{
    //    if ([self isLoginState]) {
    //        NSString *usrStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"LOGIN_USR"];
    //        NSString *pwd = [[NSUserDefaults standardUserDefaults] objectForKey:@"LOGIN_PWD"];
    ////        NSString *pcd = [[NSUserDefaults standardUserDefaults] objectForKey:@"LOGIN_PCD"];
    //        if (pwd != nil && ![pwd isEqualToString:@""]) {
    //            [ApplicationDelegate.netEngine sendLogin:usrStr pwd:pwd pcd:nil completionHandler:^(NSData *data) {} errorHandler:^(NSData *data, NSError *error) {}];
    //        }
    ////        else if (pcd != nil && ![pcd isEqualToString:@""]) {
    ////            [ApplicationDelegate.netEngine sendLogin:usrStr pwd:nil pcd:pcd completionHandler:^(NSData *data) {} errorHandler:^(NSData *data, NSError *error) {}];
    ////        }
    //    }
}

#pragma mark - 获取带sid的url
+ (NSString *)getSidUrl:(NSString *)baseUrl{
    NSString *url = [[NSString alloc] initWithString:baseUrl];
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults] objectForKey:@"LOGIN_COOKIE"];
    if (dic) {
        NSString *sid = [dic objectForKey:@"Value"];
        if ([baseUrl rangeOfString:@"?"].location == NSNotFound) {
            url = [NSString stringWithFormat:@"%@?sid=%@",baseUrl,sid];
        }else
            url = [NSString stringWithFormat:@"%@&sid=%@",baseUrl,sid];
    }else{
        if ([baseUrl rangeOfString:@"?"].location == NSNotFound) {
            url = [NSString stringWithFormat:@"%@?sid=%@",baseUrl,@"abc"];
        }else
            url = [NSString stringWithFormat:@"%@&sid=%@",baseUrl,@"abc"];
    }
    return url;
}

+ (BOOL)wirte2File:(NSString *)fileName data:(NSData *)data{
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,  NSUserDomainMask,YES);//使用C函数NSSearchPathForDirectoriesInDomains来获得沙盒中目录的全路径。该函数有三个参数，目录类型、he domain mask、布尔值。其中布尔值表示是否需要通过～扩展路径。而且第一个参数是不变的，即为NSSearchPathDirectory 。在IOS中后两个参数也是不变的，即为：NSUserDomainMask 和 YES。
    NSString *ourDocumentPath =[documentPaths objectAtIndex:0];
    NSString *FileName=[ourDocumentPath stringByAppendingPathComponent:fileName];
    return [data writeToFile:FileName atomically:YES];//将NSData类型对象data写入文件，文件名为FileName
};

+ (id)readFile:(NSString *)fileName{
    NSData *data = [NSData dataWithContentsOfFile:fileName options:0 error:NULL];
    NSError *error;
    id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    return object;
}

//压缩图片
+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    // End the context
    UIGraphicsEndImageContext();
    // Return the new image.
    return newImage;
}
#pragma mark- 返回文本的frame，（计算高度）
+(CGRect)CGframe:(NSString *)string X:(CGFloat)X Y:(CGFloat)Y width:(CGFloat)width FontOfSize:(CGFloat)Font {
    CGRect fram;
    if ([string isEqual:[NSNull null]] ||[string isEqual:nil] || [string isEqualToString:@""] ) {
        fram.size.height=0;
        fram.size.width=0;
        fram.origin.x= X;
        fram.origin.y= Y;
        return fram;
        
    }
    
    // 初始化label
    UILabel *label = [UILabel new];
    
    // label获取字符串
    label.text = string;
    
    
    // label获取字体
    label.font = [UIFont systemFontOfSize:Font];
    
    // 根据获取到的字符串以及字体计算label需要的size
    CGSize size = [self boundingRectWithSize:CGSizeMake(width, 0) Label:label];
    
    fram.size=size;
    fram.origin.x= X;
    fram.origin.y= Y;
    
    return fram;
}

+ (CGSize)boundingRectWithSize:(CGSize)size Label:(UILabel *)Label
{
    NSDictionary *attribute = @{NSFontAttributeName: Label.font};
    
    CGSize retSize = [Label.text boundingRectWithSize:size
                                             options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    // 设置无限换行
    Label.numberOfLines = 0;
    return retSize;
}


//判断是否为整形
+(BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}
//判断是否为11位数字
+(BOOL)is_11_Mobile:(NSString*)string{
    
    
    if ([string hasPrefix:@"1"] & (string.length==11)) {
        return YES;
    }else{
        
        return NO;
    }
    
}

#pragma mark- 拨打电话
+(void)call_phone_atVC:(UIViewController*)viewC phoneNO:(NSString*)phoneNO{
    
    NSString*phone_NO = [self findNumFromStr:phoneNO];
    if (phone_NO.length>0) {
        NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",phone_NO];
        UIWebView * callWebview = [[UIWebView alloc] init];
        [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
        [viewC.view addSubview:callWebview];
        NSLog(@".....");
    }
    
    
}

#pragma mark- 手机号123***5345
+(NSString*)phone_nub_reset:(NSString*)phone{
    NSString *phone_str = @"";
    if ([self is_string_not_null:phone]) {
        if (phone.length==11) {
            phone_str=[NSString stringWithFormat:@"%@****%@",[phone substringWithRange:NSMakeRange(0, 3)],[phone substringWithRange:NSMakeRange(phone.length-4, 4)]];
            
            return phone_str;
            
        }else{
            if (phone.length>0) {
                return phone;
            }
        }
    }
    
    return @"";
    
    
}

#pragma mark- NSString 转码UTF8
+(NSString*)Unicode_str:(NSString*)str{
    if ([self is_string_null:str]) {
        return @"";
    }
    
    NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)str, NULL, NULL,  kCFStringEncodingUTF8 ));
    return encodedString;
    
    
}
#pragma mark- NSString 四位一个空格
+(NSString *)countNumAndChangeformat:(NSString *)num{
    int count = 0;
    long long int a = num.longLongValue;
    while (a != 0)    {
        count++;
        a /= 10;
    }
    NSMutableString *string = [NSMutableString stringWithString:num];
    NSMutableString *newstring = [NSMutableString string];
    while (count > 4) {
        count -= 4;
        NSRange rang = NSMakeRange(string.length - 4, 4);
        NSString *str = [string substringWithRange:rang];
        [newstring insertString:str atIndex:0];
        [newstring insertString:@" " atIndex:0];
        [string deleteCharactersInRange:rang];
    }
    [newstring insertString:string atIndex:0];
    return newstring;
    
}


#pragma mark- 字典添加元素
+(void)dictionary:(NSMutableDictionary *)dic setObject:(id)object forKey:(NSString *)Key{
    
    //如果不为空则添加
    if ((object!=nil) & ![object isEqual:[NSNull null]] &(Key!=nil) & ![Key isEqual:[NSNull null]] ) {
        
        [dic setObject:(NSString *)object forKey:(NSString *)Key];
        
    }
    
}
#pragma mark- 字典添加元素2
+(void)Dictionary:(NSMutableDictionary *)dic setobject:(id)object Forkey:(NSString *)Key{
    
    //如果不为空则添加
    if ((object!=nil) & ![object isEqual:[NSNull null]] &(Key!=nil) & ![Key isEqual:[NSNull null]] ) {
        
        [dic setObject:(NSString *)object forKey:(NSString *)Key];
        
    }
    
    
}

+(BOOL)validateMobile:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    //    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CM = @"^1(3[0-9]|(4[0-9]|5[0-9]|8[0-9])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    //    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    NSString * CU = @"^1(3[0-9]|(4[0-9]|5[0-9]|8[0-9])\\d)\\d{7}$";
    
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|70|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (NSMutableDictionary *)getHbpDic{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"01" forKey:@"黄浦区"];
    [dic setObject:@"04" forKey:@"徐汇区"];
    [dic setObject:@"05" forKey:@"长宁区"];
    [dic setObject:@"06" forKey:@"静安区"];
    [dic setObject:@"07" forKey:@"普陀区"];
    [dic setObject:@"08" forKey:@"闸北区"];
    [dic setObject:@"09" forKey:@"虹口区"];
    [dic setObject:@"10" forKey:@"杨浦区"];
    [dic setObject:@"12" forKey:@"闵行区"];
    [dic setObject:@"13" forKey:@"宝山区"];
    [dic setObject:@"14" forKey:@"嘉定区"];
    [dic setObject:@"15" forKey:@"浦东新区"];
    [dic setObject:@"16" forKey:@"金山区"];
    [dic setObject:@"17" forKey:@"松江区"];
    [dic setObject:@"18" forKey:@"青浦区"];
    [dic setObject:@"20" forKey:@"奉贤区"];
    [dic setObject:@"30" forKey:@"崇明县"];
    return dic;
}

+ (NSArray *)getHbpKeyArray{
    return @[@"01",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"20",@"30",];
}


+ (NSArray *)getHbpValuesArray{
    return @[@"黄浦区",@"徐汇区",@"长宁区",@"静安区",@"普陀区",@"闸北区",@"虹口区",@"杨浦区",@"闵行区",@"宝山区",@"嘉定区",@"浦东新区",@"金山区",@"松江区",@"青浦区",@"奉贤区",@"崇明县",];
}



+(BOOL)checkPhoneNumInput:(NSString *)mobileNum{
    
    
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    //    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CM = @"^1(3[0-9]|(4[0-9]|5[0-9]|8[0-9])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    //    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    NSString * CU = @"^1(3[0-9]|(4[0-9]|5[0-9]|8[0-9])\\d)\\d{7}$";
    
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|70|8[09])[0-9]|349)\\d{7}$";
    
    
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    NSPredicate *regextestPHS = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES)
        || ([regextestPHS evaluateWithObject:mobileNum] == YES))
    {
        
        
        return YES;
        
    }
    
    else
        
    {
        
        return NO;
        
    }
    
    
    
}


//判断字符串是否为空,为空返回无
+(NSString *)stringisNOTnull:(NSString *)string{
    NSString  *getcs_tel=[[NSString alloc]init];
    if (string==nil ||[string isEqual:[NSNull new]] ||[string isEqualToString:@""]) {
        getcs_tel=@"";
    } else {
        getcs_tel= string;
    }
    
    return getcs_tel;
}
//判断字符串是否为空,为空返回无
+(BOOL)is_string_null:(NSString *)string{
    if (string==nil||[string isEqual:[NSNull new]] ||(string=NULL) ||[string isEqualToString:@""]) {
        return YES;
    } else {
        return NO;
    }
}
//判断对象是否为空,为空返回无
+(BOOL)is_object_not_NSNull:(id)object{
    if ((object== nil) ||[object isEqual:[NSNull new]] ||(object==NULL)) {
        return NO;
    } else {
        return YES;
    }
}
//判断对象不为为空
+(BOOL)is_object_NSNull:(id)object{
    if ((object== nil) ||[object isEqual:[NSNull new]] ||(object==NULL)) {
        return YES;
    } else {
        return NO;
    }
}


//判断字符串是否为空,为空返回无
+(BOOL)is_string_not_null:(NSString *)string{
    if (string==nil||[string isEqual:[NSNull new]]||(string=NULL) ||[string isEqualToString:@""]) {
        return NO;
    } else {
        
        return YES;
    }
}

#pragma mark- 显示label时赋值

+(NSString *)Label_name:(id)string{
    if ([string isKindOfClass:[NSNumber class]]) {
        
        return [NSString stringWithFormat:@"%@",string];
    }
    if (![string isKindOfClass:[NSString class]]) {
        
        return @"";
    }
    if (string==nil||[string isEqual:[NSNull new]] ) {
        return @"";
    }
    return [NSString stringWithFormat:@"%@",string];
}


#pragma mark- 判断文本的宽度
+(CGFloat)getWidthtstr:(NSString *)str allowSize:(CGFloat)height font:(CGFloat)font{
    
    str=[self Label_name:str];
    
    if ([str isEqualToString:@""]) {
        return 0;
    }
    if (height<=0) {
        return 0;
    }
    if (font<=0) {
        return 0;
    }
    
    CGSize titleSize = [str sizeWithFont:[UIFont systemFontOfSize:font] constrainedToSize:CGSizeMake(MAXFLOAT, height) lineBreakMode:NSLineBreakByWordWrapping];
    
    return titleSize.width;
}



@end

@implementation UIView (MHScreenShot)

- (UIImage *)screenshotMH{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    if ([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    } else {
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}



@end
