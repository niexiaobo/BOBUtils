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
static BOBUtils * _instance;

+(BOBUtils *)sharesInstance
{
    @synchronized(self)
    {
        if (_instance==nil) {
            _instance=[[super allocWithZone:NULL] init];
        }
    }
    return _instance;
}

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


+(NSString *)getDefaultFilePathString:(NSString *)fileName;
{
    NSString *defaultPathString = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
    return defaultPathString;
}

+(NSString *)getDocumentFilePathString:(NSString *)fileName;
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}

+(NSString *)getLibraryFilePathString:(NSString *)fileName;
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    return [libraryDirectory stringByAppendingPathComponent:fileName];
    
}

+(NSString *)getCacheFilePathString:(NSString *)fileName;
{
    NSArray *cache = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [cache objectAtIndex:0] ;
    return [cachePath stringByAppendingPathComponent:fileName];
    
}
//仅仅得到cache的路径
+(NSString *)getCachePathString;
{
    NSArray *cache = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [cache objectAtIndex:0] ;
    return cachePath;
}

+(NSString *)getTempPathString {
    return NSTemporaryDirectory();
}

+(NSString *)getTempFilePathString:(NSString *)fileName;
{
    return [NSTemporaryDirectory() stringByAppendingPathComponent:fileName];
}

+(NSString *)getResourceFilePathString:(NSString *) resourceName ofType:(NSString*)typeName;
{
    return [[NSBundle mainBundle] pathForResource: resourceName ofType: typeName];
}

+(void)removeFile:(NSString *)folderPath {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *contents = [fileManager contentsOfDirectoryAtPath:folderPath error:NULL];
    NSEnumerator *enumerator = [contents objectEnumerator];
    NSString *filename;
    while ((filename = [enumerator nextObject])) {
        [fileManager removeItemAtPath:[folderPath stringByAppendingPathComponent:filename] error:NULL];
    }
}


+ (NSString *)getSaveFilePath:(NSString *)fileName
{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [documentPath stringByAppendingPathComponent:fileName];
    return filePath;
}

+ (void)saveFilePath:(NSString *)filepath fileData:(id)info andEncodeObjectKey:(NSString *)key {
    
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver= [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    [archiver encodeObject:info forKey:key];
    [archiver finishEncoding];
    [data writeToFile:filepath atomically:YES];
}

+ (NSData *)loadDataFromFile:(NSString *)fileName anddencodeObjectKey:(NSString *)key {
    
    NSString *filePath = [self getSaveFilePath:fileName];
    
    if ([self isHaveFileAtPath:filePath]) {
        
        NSData *data1 = [NSData dataWithContentsOfFile:[self getDocumentFilePathString:fileName]];
        NSKeyedUnarchiver *archiver= [[NSKeyedUnarchiver alloc] initForReadingWithData:data1];
        id info = [archiver decodeObjectForKey:key];
        [archiver finishDecoding];
        return info;
    }
    return nil;
}

+ (NSString *)loadClientVersionKey:(NSString *)key {
    
    NSDictionary *configCenterDic = (NSDictionary *)[self loadDataFromFile:@"configCenter.json" anddencodeObjectKey:@"configCenter"];
    NSPredicate *bobPredicate = [NSPredicate predicateWithFormat:key];
    NSArray *configcenterArray = [[configCenterDic objectForKey:@"configCenterList"] filteredArrayUsingPredicate:bobPredicate];
    NSDictionary *legalServiceDic = [NSDictionary dictionaryWithDictionary:[configcenterArray firstObject]];
    return [legalServiceDic objectForKey:@"value"];
}

+ (BOOL)isHaveFileAtPath:(NSString *)path
{
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

//判断文件夹是否存在
+(BOOL)judgeFileExist:(NSString * )fileName;
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString * filePath=[documentsDirectory stringByAppendingPathComponent:fileName];
    NSFileManager * fileManager=[NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:filePath];
}

//去掉前后空格
+ (NSString *) getDisposalStr:(NSString *)s;
{
    if (![@"" isEqualToString:s]) {
        return [s stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
    return @"";
}

+(NSInteger)weiBoCountWord:(NSString*)s {
    NSUInteger i,n=[s length],l=0,a=0,b=0;
    unichar c;
    for(i=0;i<n;i++){
        c=[s characterAtIndex:i];
        if(isblank(c)){
            b++;
        }else if(isascii(c)){
            a++;
        }else{
            l++;
        }
    }
    if(a==0 && l==0) return 0;
    return l+(int)ceilf((float)(a+b)/2.0);
}

//获取数据MD5值
+ (NSString *)md5:(NSData *)data
{
    CC_MD5_CTX md5;
    CC_MD5_Init(&md5);
    CC_MD5_Update(&md5,[data bytes],[data length]);
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &md5);
    
    NSString* s = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                   digest[0], digest[1],
                   digest[2], digest[3],
                   digest[4], digest[5],
                   digest[6], digest[7],
                   digest[8], digest[9],
                   digest[10], digest[11],
                   digest[12], digest[13],
                   digest[14], digest[15]];
    return s;
}

////判断是否是有效的email
//+(BOOL)isEmail:(NSString *)input{
//    return [input isMatchedByRegex:@"\\b([a-zA-Z0-9%_.+\\-]+)@([a-zA-Z0-9.\\-]+?\\.[a-zA-Z]{2,6})\\b"];
//
//}

//判断密码8-16位且同时包含数字和字母
+(BOOL)judgePassWordLegal:(NSString *)pass{
    
    //    ^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$
    //
    //    分开来注释一下：
    //    ^ 匹配一行的开头位置
    //    (?![0-9]+$) 预测该位置后面不全是数字
    //    (?![a-zA-Z]+$) 预测该位置后面不全是字母
    //    [0-9A-Za-z] {8,16} 由8-16位数字或这字母组成
    //    $ 匹配行结尾位置
    BOOL result = false;
    if ([pass length] >= 6){
        // 判断长度大于8位后再接着判断是否同时包含数字和字符(?![0-9]+$)(?![a-zA-Z]+$)
        NSString * regex = @"^[0-9A-Za-z]{6,20}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        result = [pred evaluateWithObject:pass];
    }
    return result;
}

+(BOOL)isMobileNum:(NSString *)input{
    //普通手机号码
    NSString *emailRegex = @"^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$";
    //座机
    NSString *phone=@"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    NSPredicate *phoneRegex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phone];
    if (([emailTest evaluateWithObject:input]==YES)||([phoneRegex evaluateWithObject:input]==YES)) {
        return YES;
    }else{
        return NO;
    }
    
    
    //    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d|705)\\d{7}$";
    //    NSString * CU = @"^1((3[0-2]|5[256]|8[56])\\d|709)\\d{7}$";
    //    NSString * CT = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
    //    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    //
    //    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    //
    //    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    //
    //    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    //
    //    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",PHS];
    //
    //
    //
    //    if (([regextestcm evaluateWithObject:input] == YES)
    //
    //        || ([regextestct evaluateWithObject:input] == YES)
    //
    //        || ([regextestcu evaluateWithObject:input] == YES)
    //
    //        || ([regextestphs evaluateWithObject:input] == YES))
    //
    //    {
    //
    //        return YES;
    //
    //    }
    //
    //    else
    //
    //    {
    //
    //        return NO;
    //
    //    }
    ////    if ([input length] == 0) {
    //
    //        return NO;
    //
    //    }
    //    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,3,5-9]))\\d{8}$";
    //    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    //    BOOL isMatch = [pred evaluateWithObject:input];
    //    if (!isMatch) {
    //        return NO;
    //    }
    //    return YES;
}

+(BOOL)isIdentityCardNo:(NSString *)input {
    NSString *emailRegex = @"\\d{15}|(\\d{17}([0-9]|X|x)$)";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:input];
}

#pragma mark--//判断是否是银行卡号
+(BOOL)isBankCardNumber:(NSString *)input{
    NSString *emailRegex = @"^[0-9]{16,19}$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:input];
}

+(BOOL)isYouBian:(NSString *)input
{
    
    NSString *emailRegex = @"[1-9]\\d{5}(?!\\d)";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:input];
}
+(BOOL)isNumber:(NSString *)input {
    NSString *emailRegex = @"[0-9]+$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:input];
}
#pragma mark-- ///密码 长度6-18位，只能包含字符、数字和下划线
+(BOOL)isPassWord:(NSString *)input{
    NSString *emailRegex = @"^\\w{6,18}$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:input];
    
}


+ (NSString *)millisecondConvertedToDay:(unsigned long long )time {
    
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:time/1000.0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)millisecondToDateByFormatter:(unsigned long long)time formattter:(NSString * ) format {
    
    if (format==nil||[format isEqualToString:@""]) {
        format=@"yyyy-MM-dd HH:mm:ss";
    }
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:time/1000.0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)secondToDateByFormatter:(unsigned long long)time formattter:(NSString * ) format {
    if (format==nil||[format isEqualToString:@""]) {
        format=@"yyyy-MM-dd HH:mm:ss";
    }
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)translateDateString:(NSString *)translateDateString format:(NSString *)format toFormat:(NSString *)tofarmt {
    if (translateDateString==nil || format==nil || tofarmt == nil) {
        return @"";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *translateDate = [dateFormatter dateFromString:translateDateString];
    
    NSDateFormatter *translateDateFormatter = [[NSDateFormatter alloc] init];
    [translateDateFormatter setDateFormat:tofarmt];
    NSString *string = [translateDateFormatter stringFromDate:translateDate];
    
    return string;
}
+ (NSString *)getTimeByTimeString:(NSString *)timeString {
    timeString = [NSString stringWithFormat:@"%@",timeString];
    if (timeString.length>0) {
        timeString = [timeString substringWithRange:NSMakeRange(0,timeString.length-3)];
        NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        [formatter setTimeZone:timeZone];
        NSTimeInterval timeS=[timeString doubleValue];
        NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:timeS];
        NSString *timestr = [formatter stringFromDate:detaildate];
        return timestr;
    }else{
        return @"";
    }
}
+ (NSString *)getWeekdayFromDate:(NSString *)dateStr formatter:(NSString *)matter {
    
    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents* components = [[NSDateComponents alloc] init];
    
    NSInteger unitFlags = NSCalendarUnitYear |
    
    NSCalendarUnitMonth |
    
    NSCalendarUnitDay |
    
    NSCalendarUnitWeekday |
    
    NSCalendarUnitHour |
    
    NSCalendarUnitMinute |
    
    NSCalendarUnitSecond;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:matter];
    NSDate *date = [formatter dateFromString:dateStr];
    
    if (date == nil) {
        return @"";
    }
    components = [calendar components:unitFlags fromDate:date];
    
    NSUInteger weekday = [components weekday];
    
    switch (weekday) {
        case 1:
            return @"星期天";
            break;
        case 2:
            return @"星期一";
            break;
        case 3:
            return @"星期二";
            break;
        case 4:
            return @"星期三";
            break;
        case 5:
            return @"星期四";
            break;
        case 6:
            return @"星期五";
            break;
        case 7:
            return @"星期六";
            break;
        default:
            return @"";
            break;
    }
    return @"";
}

+ (UIImage *)fixOrientation:(UIImage *)aImage {
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

+(UIImage*)scaleToSize:(UIImage*)img size:(CGSize)size
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    
    // 返回新的改变大小后的图片
    return scaledImage;
}


+(NSString *)ToHex:(long long int)tmpid
{
    //    NSString *endtmp=@"";
    NSString *nLetterValue;
    //    NSString *nStrat;
    NSString *str =@"";
    //    tmpid = 13621631651;
    long long int ttmpig;
    
    
    
    for (int i = 0; i<9; i++) {
        
        
        ttmpig=tmpid%16;
        
        tmpid=tmpid/16;
        switch (ttmpig)
        {
            case 10:
                nLetterValue =@"A";break;
            case 11:
                nLetterValue =@"B";break;
            case 12:
                nLetterValue =@"C";break;
            case 13:
                nLetterValue =@"D";break;
            case 14:
                nLetterValue =@"E";break;
            case 15:
                nLetterValue =@"F";break;
            default:nLetterValue=[[NSString alloc]initWithFormat:@"%lli",ttmpig];
                
        }
        str = [nLetterValue stringByAppendingString:str];
        if (tmpid == 0) {
            break;
        }
        
    }
    
    //        } while (tmpid == 0);
    //
    return str;
}

//得到日期开始和结束时间
+(NSArray *)getStartDayAndEndDay:(TimeStateType)type{
    NSDate *today = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dayComponents = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitWeekday|NSCalendarUnitMonth|kCFCalendarUnitYear) fromDate:today];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:0];
    if (type==WeekType) {
        NSInteger weekday = [dayComponents weekday];
        NSInteger week = [dayComponents week];
        NSLog(@"week :%ld",(long)week);
        NSDate *startDate = [[NSDate alloc] initWithTimeIntervalSinceNow:-weekday*60*60*24];
        NSString *startString = [formatter stringFromDate:startDate];
        
        for(int i = 1;i<5;i++){
            NSDate *endDate = [NSDate dateWithTimeInterval:-(7*i*60*60*24) sinceDate:startDate];
            NSString *endString = [formatter stringFromDate:endDate];
            startString = [startString stringByReplacingOccurrencesOfString:@"-" withString:@"."];
            endString = [endString stringByReplacingOccurrencesOfString:@"-" withString:@"."];
            [temp addObject:[NSString stringWithFormat:@"%@-%@",endString,startString]];
            startString = endString;
            startDate = endDate;
        }
    }else if(type==MonthType){
        NSInteger month  =  [dayComponents month];
        NSInteger year= [dayComponents year];
        for (int i=1; i<5; i++) {
            if (month==1) {
                year--;
            }
            month = month==1?12:month-1;
            
            dayComponents.day = 1;
            dayComponents.year=year;
            dayComponents.month = month;
            NSRange range = [gregorian rangeOfUnit:NSCalendarUnitDay
                                            inUnit:NSCalendarUnitMonth
                                           forDate:[gregorian dateFromComponents:dayComponents]];
            NSDate *firstDate = [gregorian dateFromComponents:dayComponents];
            [dayComponents setDay:range.length];
            NSDate *lastDate = [gregorian dateFromComponents:dayComponents];
            NSString *startString = [formatter stringFromDate:firstDate];
            NSString *endString = [formatter stringFromDate:lastDate];
            startString = [startString stringByReplacingOccurrencesOfString:@"-" withString:@"."];
            endString = [endString stringByReplacingOccurrencesOfString:@"-" withString:@"."];
            [temp addObject:[NSString stringWithFormat:@"%@-%@",startString,endString]];
        }
        
        
    }
    
    return temp;
}


+(long long) fileSizeAtPath:(NSString*) filePath
{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}


//获取文件夹大小
+(long long)folderSize:(const char *)folderPath {
    long long folderSize = 0;
    DIR* dir = opendir(folderPath);
    if (dir == NULL) {
        return 0;
    }
    struct dirent* child;
    while ((child = readdir(dir)) != NULL) {
        if (child->d_type == DT_DIR
            && (child->d_name[0] == '.' && child->d_name[1] == 0)) {
            continue;
        }
        
        if (child->d_type == DT_DIR
            && (child->d_name[0] == '.' && child->d_name[1] == '.' && child->d_name[2] == 0)) {
            continue;
        }
        
        NSUInteger folderPathLength = strlen(folderPath);
        char childPath[1024];
        stpcpy(childPath, folderPath);
        if (folderPath[folderPathLength - 1] != '/'){
            childPath[folderPathLength] = '/';
            folderPathLength++;
        }
        
        stpcpy(childPath + folderPathLength, child->d_name);
        childPath[folderPathLength + child->d_namlen] = 0;
        if (child->d_type == DT_DIR){
            folderSize += [self folderSize:childPath];
            struct stat st;
            if (lstat(childPath, &st) == 0) {
                folderSize += st.st_size;
            }
        } else if (child->d_type == DT_REG || child->d_type == DT_LNK){
            struct stat st;
            if (lstat(childPath, &st) == 0) {
                folderSize += st.st_size;
            }
        }
    }
    
    return folderSize;
}

+ (NSString *)translateToCardString:(NSString *)string interval:(NSInteger)interval
{
    if (!string) {
        return @"";
    }
    NSMutableString *translateStr = [NSMutableString stringWithString:string];
    
    NSInteger tempNum = 0;
    for (int i = 0; i < string.length; i++) {
        
        if (i%interval==0 && i>0) {
            ///插入空格
            [translateStr insertString:@" " atIndex:i+tempNum];
            tempNum++;
        }
    }
    return translateStr;
}

+ (NSAttributedString *)getDifferentColorString:(NSString *)totalStr oneStr:(NSString *)oneStr color:(UIColor *)oneColor otherStr:(NSString *)otherStr ortherColor:(UIColor *)otherColor {
    
    NSMutableAttributedString *registerStr = [[NSMutableAttributedString alloc] initWithString:totalStr];
    if (oneStr) {
        NSRange range1 = NSMakeRange(0, oneStr.length);
        [registerStr addAttribute:NSForegroundColorAttributeName value:oneColor range:range1];
    }
    if (otherStr) {
        NSRange range2 = NSMakeRange(oneStr.length, otherStr.length);
        [registerStr addAttribute:NSForegroundColorAttributeName value:oneColor range:range2];
        //[registerStr setAttributes:@{NSForegroundColorAttributeName:otherColor,
        //                                     NSFontAttributeName:[UIFont systemFontOfSize:10.0]}
        //                             range:range2];
    }
    
    return registerStr;
}

+ (NSAttributedString *)getDifferentFontString:(NSString *)totalStr oneStr:(NSString *)oneStr font:(NSInteger)oneFont otherStr:(NSString *)otherStr ortherFont:(NSInteger)otherFont {
    NSMutableAttributedString *registerStr = [[NSMutableAttributedString alloc] initWithString:totalStr];
    if (oneStr) {
        NSRange range1 = NSMakeRange(0, oneStr.length);
        [registerStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:oneFont] range:range1];
    }
    if (otherStr) {
        NSRange range2 = NSMakeRange(oneStr.length, otherStr.length);
        [registerStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:otherFont] range:range2];
    }
    return registerStr;
}

//设置一段字符串显示两种加横线
+(NSAttributedString *)getDifferentUnderLineString:(NSString *)totalStr andRange:(NSRange)myRange andLineColor:(UIColor *)lineColor{
    NSMutableAttributedString *registerStr = [[NSMutableAttributedString alloc] initWithString:totalStr];
    //[registerStr setAttributes:@{NSForegroundColorAttributeName:otherColor,
    //                                     NSFontAttributeName:[UIFont systemFontOfSize:10.0]}
    //                             range:range2];
    //
    //       [rightLineAttri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, _rightOldPrice.text.length)];
    [registerStr setAttributes:@{NSForegroundColorAttributeName:lineColor,
                                 NSStrikethroughStyleAttributeName:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) } range:myRange];
    return registerStr;
}

+ (NSAttributedString *)getDifferentFontStringWithTotalString:(NSString *)totalStr andInfo:(NSArray *)info {
    
    NSMutableAttributedString *registerStr = [[NSMutableAttributedString alloc] initWithString:totalStr];
    @try {
        CGFloat tempLength = 0;
        
        for (int i =0; i < info.count; i++) {
            NSArray *tempArray = [info objectAtIndex:i];
            NSString *str = [tempArray firstObject];
            UIColor *color = [tempArray objectAtIndex:1];
            UIFont *font = [tempArray lastObject];
            
            NSRange range = NSMakeRange(tempLength, str.length);
            [registerStr setAttributes:@{NSForegroundColorAttributeName:color,
                                         NSFontAttributeName:font}
                                 range:range];
            
            tempLength+=str.length;
        }
    }
    @catch (NSException *exception) {
        ///
    }
    @finally {
        ///
    }
    
    
    return registerStr;
}

+ (NSMutableAttributedString *)getLineSpaceString:(NSString *)string lineSpace:(CGFloat)space alignment:(NSTextAlignment)alignment {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];//调整行间距
    paragraphStyle.alignment = alignment;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [string length])];
    return attributedString;
}

+ (NSString *)getBankName:(NSString *)bankCode {
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"BankLogoList" ofType:@"plist"];
    NSMutableDictionary *bankDic = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    NSDictionary *bankInfo = [bankDic objectForKey:bankCode];
    
    if (bankInfo==nil) {
        return @"";
    }
    return [bankInfo objectForKey:@"name"];
    
}

+ (NSString *)getBankLogo:(NSString *)bankCode {
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"BankLogoList" ofType:@"plist"];
    NSMutableDictionary *bankDic = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    NSDictionary *bankInfo = [bankDic objectForKey:bankCode];
    
    if (bankInfo==nil) {
        return @"";
    }
    return [bankInfo objectForKey:@"logo"];
    
}

+ (NSString *)getBankCardType:(NSString *)bankCardtype {
    
    NSDictionary *bankCardTypeDic = @{@"00": @"未知",
                                      @"01": @"借记账户",
                                      @"02": @"贷记账户",
                                      @"03": @"准贷记账户",
                                      @"04": @"借贷合一账户",
                                      @"05": @"预付费账户",
                                      @"06": @"半开放预付费账户"};
    NSString *temp = [bankCardTypeDic objectForKey:bankCardtype];
    return temp==nil?@"":temp;
}

+ (NSString *)stringByInfoArray:(NSArray *)array stepetorStr:(NSString *)str {
    
    NSString *tempStr = [NSString string];
    for (int i = 0; i < array.count; i++) {
        NSString *string = array[i];
        if (string&&string.length>0) {
            if (i!=0) {
                tempStr = [tempStr stringByAppendingString:str];
            }
            tempStr = [tempStr stringByAppendingString:string];
        }
    }
    return tempStr;
}

+ (NSString *)stringByStepetorStr:(NSString *)str andInfo:(NSString *)info, ... {
    
    NSString *tempStr = [NSString string];
    
    
    va_list args;
    va_start(args, info);
    
    NSUInteger i = 0;
    NSString *otherString;
    if (info&&info.length>0) {
        tempStr = [tempStr stringByAppendingString:info];
        i = 1;
    }
    while ((otherString = va_arg(args, NSString *)))
    {
        //依次取得所有参数
        if (otherString&&otherString.length>0) {
            if (i!=0) {
                tempStr = [tempStr stringByAppendingString:str];
            }
            tempStr = [tempStr stringByAppendingString:otherString];
            i++;
            
        }
    }
    
    va_end(args);
    
    return tempStr;
}

+ (UILabel *)lineLabelWithFrame:(CGRect)frame color:(UIColor *)color {
    UILabel *lineLabel = [[UILabel alloc] init];
    lineLabel.backgroundColor = color;
    lineLabel.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 0.5);
    
    return lineLabel;
}

+ (NSMutableAttributedString *)setTextColor:(UIColor *)textColor  withRange:(NSRange)textRange withString:(NSString *)string
{
    NSMutableAttributedString *mutableString =[[NSMutableAttributedString alloc] initWithString:string];
    [mutableString addAttribute:NSForegroundColorAttributeName value:textColor range:textRange];
    return mutableString;
}

// 判断数据是否为空或空对象
+ (BOOL)dataIsNull:(id)string {
    if ([string isEqual:[NSNull null]] || string == nil) {
        return YES;
    }
    return NO;
}

+ (NSIndexPath*)getIndexPathBy:(UIEvent*)event inView:(UITableView*)view{
    NSSet *touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:view];
    NSIndexPath *indexPath = [view indexPathForRowAtPoint:point];
    return indexPath;
}
#pragma mark- 拨打电话
+(void)callPeopleBy:(NSString*)call view:(UIView*)view
{
    UIWebView*callWebview =[[UIWebView alloc] init];
    
    NSString *telUrl = [NSString stringWithFormat:@"tel:%@",call];
    
    NSURL *telURL =[NSURL URLWithString:telUrl];// 貌似tel:// 或者 tel: 都行
    
    [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
    
    //记得添加到view上
    
    [view addSubview:callWebview];
}

#pragma mark ---- 获取手机唯一ID
+ (NSString *)getDeviceIdentify{
    
    NSString *idf=@"";
    NSMutableDictionary *dic = [self load:@"ZC"];
    if ([dic objectForKey:@"ZC"]==nil) {
        NSMutableDictionary *usernamepasswordKVPairs = [NSMutableDictionary dictionary];
        NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        idfv =[idfv stringByReplacingOccurrencesOfString:@"-" withString:@""];
        [usernamepasswordKVPairs setObject:idfv forKey:@"ZC"];
        [self save:@"ZC" data:usernamepasswordKVPairs];
        idf=idfv;
    }
    else {
        
        idf=[dic objectForKey:@"ZC"];
    }
    NSLog(@"设备唯一标识:%@",idf);
    return idf;
    
}

#pragma mark ----
+(NSMutableArray *)getPhoneInfo{
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    NSString *phoneName = [[UIDevice currentDevice]name];
    NSString *systemName = [[UIDevice currentDevice]systemName];
    [array addObject:phoneName];
    [array addObject:systemName];
    return array;
}

// 获取数据
+ (NSMutableDictionary *)keychainQuery:(NSString *)key
{
    if (key) {
        return [NSMutableDictionary dictionaryWithObjectsAndKeys:
                (__bridge_transfer id)kSecClassGenericPassword, (__bridge_transfer id)kSecClass,
                key, (__bridge_transfer id)kSecAttrService,
                key, (__bridge_transfer id)kSecAttrAccount,
                (__bridge_transfer id)kSecAttrAccessibleAfterFirstUnlock, (__bridge_transfer id)kSecAttrAccessible,
                nil];
    }
    
    return nil;
}

// 保存数据
+ (void)save:(NSString *)key data:(id)data
{
    if (key && data != nil) {
        //Get search dictionary
        NSMutableDictionary *keychainQuery = [self keychainQuery:key];
        //Delete old item before add new item
        SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
        //Add new object to search dictionary(Attention:the data format)
        [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge_transfer id)kSecValueData];
        //Add item to keychain with the search dictionary
        SecItemAdd((__bridge_retained CFDictionaryRef)keychainQuery, NULL);
    }
}

// 加载数据
+ (id)load:(NSString *)key
{
    id ret = nil;
    
    if (key) {
        NSMutableDictionary *keychainQuery = [self keychainQuery:key];
        //Configure the search setting
        [keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge_transfer id)kSecReturnData];
        [keychainQuery setObject:(__bridge_transfer id)kSecMatchLimitOne forKey:(__bridge_transfer id)kSecMatchLimit];
        CFDataRef keyData = NULL;
        if (SecItemCopyMatching((__bridge_retained CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
            @try {
                ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge_transfer NSData *)keyData];
            }
            @catch (NSException *e) {
                NSLog(@"Unarchive of %@ failed: %@", key, e);
            }
            @finally {}
        }
    }
    return ret;
}

// 删除数据
+ (void)delete:(NSString *)key
{
    NSMutableDictionary *keychainQuery = [self keychainQuery:key];
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
}


#pragma mark ---  *获取网络图片

+(void)setImgUrl:(NSString *)imgUrl toImgView:(UIImageView *)imgView{
    
    [imgView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"cc.png"]];
}

#pragma mark ---  *  获取按钮的网络图片

+(void)setBtnImgUrl:(NSString *)imgUrl toBtnImgView:(UIButton *)Btn{
    [Btn sd_setImageWithURL:[NSURL URLWithString:imgUrl] forState:UIControlStateNormal];
}

#pragma mark --剪贴图片
+(UIImage *)changeImg:(UIImage*)image {
    CGFloat imgWidth = image.size.width;
    CGFloat imgHeight = image.size.height;
    CGRect picChangedFrame;
    if (imgWidth > imgHeight) {
        picChangedFrame = CGRectMake((imgWidth-imgHeight)/2, 0, imgHeight, imgHeight);
    }else if (imgWidth < imgHeight) {
        picChangedFrame = CGRectMake((imgHeight-imgWidth)/2, 0, imgWidth, imgWidth);
    }else {
        picChangedFrame = CGRectMake(0, 0, imgWidth, imgWidth);
    }
    
    CGImageRef subImageRef = CGImageCreateWithImageInRect(image.CGImage, picChangedFrame);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    return smallImage;
}

#pragma mark ---- 过滤
+(NSString *)filterHTML:(NSString *)html
{
    NSRange range = [html rangeOfString:@"<"];
    if (range.length == 0) {
        NSRange rang1 = [html rangeOfString:@"&#39"];
        if (rang1.length == 0) {
            return html;
        }else {
            html = [html stringByReplacingOccurrencesOfString:@"&#39" withString:@"'"];
            html = [html stringByReplacingOccurrencesOfString:@"#39" withString:@""];
        }
    }
    
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while([scanner isAtEnd]==NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
        html = [html stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
    }
    //    NSString * regEx = @"<([^>]*)>";
    //    html = [html stringByReplacingOccurrencesOfString:regEx withString:@""];
    return html;
}

#pragma mark--过滤 符号
+(NSString*)changeStr:(NSString *)str
{
    
    //    str = [Utils filterHTML:str];
    //
    //    NSString *regex=@"(@\\w+)|(#[^#]+#)|(\\$[^\\$]+\\$)|(http(s)?://([A-Za-z0-9._-]+(/)?)*)";
    //    NSArray *matchArr=[str componentsMatchedByRegex:regex];
    //    NSString *repStr=@"";
    //    for (NSString *linkStr in matchArr) {
    //        if ([linkStr hasPrefix:@"@"]) {
    //            repStr=[NSString stringWithFormat:@"<a href='user://%@'>%@</a>",[self URLEncodedString:linkStr],linkStr];
    //        }
    //        else if ([linkStr hasPrefix:@"http"]) {
    //            repStr=[NSString stringWithFormat:@"<a href='%@'>%@</a>",linkStr,linkStr];
    //        }
    //        else if ([linkStr hasPrefix:@"#"]) {
    //            repStr=[NSString stringWithFormat:@"<a href='topic://%@'>%@</a>",[self URLEncodedString:linkStr],linkStr];
    //        }else if ([linkStr hasPrefix:@"$"]){
    //            repStr=[NSString stringWithFormat:@"<a href='money://%@'>%@</a>",[self URLEncodedString:linkStr],linkStr];
    //        }
    //        if(repStr!=nil)
    //        {
    //            str=[str stringByReplacingOccurrencesOfString:linkStr withString:repStr];
    //        }
    //    }
    return str;
    
}

#pragma mark - url转码解码
+ (NSString*)URLDecodedString:(NSString *)str
{
    //    NSString *result = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,(CFStringRef)str,CFSTR(""),kCFStringEncodingUTF8);
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,(CFStringRef)str,CFSTR(""),kCFStringEncodingUTF8));
    if(result)
        return result;
    return @"";
}
+ (NSString *)URLEncodedString:(NSString *)str
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)str,NULL,CFSTR(":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`"),kCFStringEncodingUTF8));
    if(result)
        return result;
    return @"";
}

#pragma mark---textfield输入框字数的限制
+(void)mTextFieldDidChangeLimitLetter:(UITextField *)textField andLimitLength:(NSInteger)mLengh{
    NSString *toBeString = textField.text;
    NSString *lang = [textField.textInputMode primaryLanguage];
    if ([lang isEqualToString:@"zh-Hans"])// 简体中文输入
    {
        //获取高亮部分
        UITextRange *selectedRange = [textField markedTextRange];
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position)
        {
            if (toBeString.length > mLengh)
            {
                textField.text = [toBeString substringToIndex:mLengh];
            }
        }
        if ([self stringContainsEmoji:textField.text]) {
            NSInteger mlong = textField.text.length;
            textField.text = [toBeString substringToIndex:mlong-2];
            [self showMess:@"不能输入表情符号"];
        }
    }else if([self stringContainsEmoji:textField.text]) {
        NSInteger mlong = textField.text.length;
        textField.text = [toBeString substringToIndex:mlong-2];
        [self showMess:@"不能输入表情符号"];
        
    }else{// 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        if (toBeString.length > mLengh)
        {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:mLengh];
            if (rangeIndex.length == 1)
            {
                textField.text = [toBeString substringToIndex:mLengh];
            }
            else
            {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, mLengh)];
                textField.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
    
}

#pragma mark---TextView 输入框字数的限制
+(void)mTextViewDicChangeRangeLimit:(UITextView *)textView andLimitLenth:(NSInteger)mLengh{
    NSString *toBeString = textView.text;
    NSString *lang = [textView.textInputMode primaryLanguage];
    if ([lang isEqualToString:@"zh-Hans"])// 简体中文输入
    {
        //获取高亮部分
        UITextRange *selectedRange = [textView markedTextRange];
        UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
        
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position)
        {
            if (toBeString.length > mLengh)
            {
                textView.text = [toBeString substringToIndex:mLengh];
            }
        }
        if ([self stringContainsEmoji:textView.text]) {
            NSInteger mlong = textView.text.length;
            textView.text = [toBeString substringToIndex:mlong-2];
            [self showMess:@"不能输入表情符号"];
        }
    }else if([self stringContainsEmoji:textView.text]) {
        NSInteger mlong = textView.text.length;
        textView.text = [toBeString substringToIndex:mlong-2];
        [self showMess:@"不能输入表情符号"];
        
    }else{// 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        if (toBeString.length > mLengh)
        {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:mLengh];
            if (rangeIndex.length == 1)
            {
                textView.text = [toBeString substringToIndex:mLengh];
            }
            else
            {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, mLengh)];
                textView.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
    
}

+ (BOOL)stringContainsEmoji:(NSString *)string
{
    // 过滤所有表情。returnValue为NO表示不含有表情，YES表示含有表情
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        
        const unichar hs = [substring characterAtIndex:0];
        // surrogate pair
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    returnValue = YES;
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3) {
                returnValue = YES;
            }
        } else {
            // non surrogate
            if (0x2100 <= hs && hs <= 0x27ff) {
                returnValue = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                returnValue = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                returnValue = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                returnValue = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                returnValue = YES;
            }
        }
    }];
    return returnValue;
}

#pragma mark---修改textField placeholder的颜色
+(void)changeTextFieldPlaceholderColor:(UITextField *)textField{
    [textField setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
}

#pragma mark---字符串的处理
+(NSString *)getChangeToFloatType:(NSString *)mStr{
    return [NSString stringWithFormat:@"%.1f",[mStr floatValue]];
}

#pragma mark--输入框只能输入一位小数
+(BOOL)isInputOnePoint:(UITextField *)textField{
    NSArray *arr = [textField.text componentsSeparatedByString:@"."];
    if (arr.count==2) {
        NSString *lastStr = arr[1];
        if (lastStr.length<2) {
            return YES;
        }else{
            return NO;
        }
    }else{
        return YES;
    }
    
}

/** 判断当前输入的是不是数字*/
+ (BOOL)isNumberInTextField:(UITextField *)startPriceTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    BOOL isHaveDian = NO;
    if ([startPriceTextField.text rangeOfString:@"."].location==NSNotFound) {
        isHaveDian=NO;
    }else {
        isHaveDian = YES;
    }
    if ([string length]>0)
    {
        unichar single=[string characterAtIndex:0];//当前输入的字符
        if ((single >='0' && single<='9') || single=='.')//数据格式正确
        {
            //首字母不能为0和小数点
            if([startPriceTextField.text length]==0){
                if(single == '.'){
                    
                    [self showMess:@"亲，第一个数字不能为小数点"];
                    [startPriceTextField.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                    
                }
                if (startPriceTextField.text.length>=2) {
                    unichar single2=[startPriceTextField.text characterAtIndex:1];
                    if (single2 != '.' && single == '0'){
                        [self showMess:@"亲，你输入的格式不正确"];
                        return NO;
                    }
                }
                
            }
            if (single=='.')
            {
                if(!isHaveDian)//text中还没有小数点
                {
                    isHaveDian=YES;
                    return YES;
                }else
                {
                    [self showMess:@"亲，你已经输入过小数点了"];
                    [startPriceTextField.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
            }
            else
            {
                if (isHaveDian)//存在小数点
                {
                    //判断小数点的位数
                    NSRange ran=[startPriceTextField.text rangeOfString:@"."];
                    NSInteger tt=range.location-ran.location;
                    if (tt <= 1){
                        return YES;
                    }else{
                        [self showMess:@"只能输入到小数点后一位"];
                        return NO;
                    }
                }
                else
                {
                    if (startPriceTextField.text.length==1) {
                        unichar single2=[startPriceTextField.text characterAtIndex:0];
                        if (single != '.' && single2 == '0'){
                            [self showMess:@"亲，你输入的格式不正确"];
                            return NO;
                        }
                    }
                    return YES;
                }
            }
        }else{//输入的数据格式不正确
            [self showMess:@"亲，你输入的格式不正确"];
            [startPriceTextField.text stringByReplacingCharactersInRange:range withString:@""];
            return NO;
        }
    }
    else
    {
        return YES;
    }
}


+(void)showMess:(NSString *)msg{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = nil;
    hud.detailsLabelText = msg;
    hud.detailsLabelFont = [UIFont systemFontOfSize:13];
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2.5];
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
