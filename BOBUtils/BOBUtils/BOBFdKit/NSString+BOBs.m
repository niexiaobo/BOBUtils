//
//  NSString+BOBs.m
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import "NSString+BOBs.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (BOBs)
+ (NSString *)searchInString:(NSString *)string charStart:(char)start charEnd:(char)end
{
    int inizio = 0, stop = 0;
    for(int i = 0; i < [string length]; i++)
    {
        if([string characterAtIndex:i] == start)
        {
            inizio = i+1;
            i += 1;
        }
        if([string characterAtIndex:i] == end)
        {
            stop = i;
            break;
        }
    }
    stop -= inizio;
    NSString *string2 = [[string substringFromIndex:inizio-1] substringToIndex:stop+1];
    
    return string2;
}

- (NSString *)searchCharStart:(char)start charEnd:(char)end
{
    int inizio = 0, stop = 0;
    for(int i = 0; i < [self length]; i++)
    {
        if([self characterAtIndex:i] == start)
        {
            inizio = i+1;
            i += 1;
        }
        if([self characterAtIndex:i] == end)
        {
            stop = i;
            break;
        }
    }
    stop -= inizio;
    NSString *string = [[self substringFromIndex:inizio-1] substringToIndex:stop+1];
    
    return string;
}

- (NSString *)MD5
{
    if(self == nil || [self length] == 0)
        return nil;
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH], i;
    CC_MD5([self UTF8String], (int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    for(i=0;i<CC_MD5_DIGEST_LENGTH;i++)
    {
        [ms appendFormat: @"%02x", (int)(digest[i])];
    }
    return [ms copy];
}

- (NSString *)SHA1
{
    if(self == nil || [self length] == 0)
        return nil;
    
    unsigned char digest[CC_SHA1_DIGEST_LENGTH], i;
    CC_SHA1([self UTF8String], (int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    for(i=0;i<CC_SHA1_DIGEST_LENGTH;i++)
    {
        [ms appendFormat: @"%02x", (int)(digest[i])];
    }
    return [ms copy];
}

- (NSString *)SHA256
{
    if(self == nil || [self length] == 0)
        return nil;
    
    unsigned char digest[CC_SHA256_DIGEST_LENGTH], i;
    CC_SHA256([self UTF8String], (int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    for(i=0;i<CC_SHA256_DIGEST_LENGTH;i++)
    {
        [ms appendFormat: @"%02x", (int)(digest[i])];
    }
    return [ms copy];
}

- (NSString *)SHA512
{
    if(self == nil || [self length] == 0)
        return nil;
    
    unsigned char digest[CC_SHA512_DIGEST_LENGTH], i;
    CC_SHA512([self UTF8String], (int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    for(i=0;i<CC_SHA512_DIGEST_LENGTH;i++)
    {
        [ms appendFormat: @"%02x", (int)(digest[i])];
    }
    return [ms copy];
}

- (BOOL)hasString:(NSString *)substring
{
    return !([self rangeOfString:substring].location == NSNotFound);
}

- (BOOL)isEmail
{
    NSString *emailRegEx =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    return [regExPredicate evaluateWithObject:[self lowercaseString]];
}

+ (BOOL)isEmail:(NSString *)email
{
    NSString *emailRegEx =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    return [regExPredicate evaluateWithObject:[email lowercaseString]];
}

+ (NSString *)convertToUTF8Entities:(NSString *)string
{
    NSString *isoEncodedString = [[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
                                                                  [string stringByReplacingOccurrencesOfString:@"%27" withString:@"'"]
                                                                  stringByReplacingOccurrencesOfString:[@"%e2%80%99" capitalizedString] withString:@"’"]
                                                                 stringByReplacingOccurrencesOfString:[@"%2d" capitalizedString] withString:@"-"]
                                                                stringByReplacingOccurrencesOfString:[@"%c2%ab" capitalizedString] withString:@"«"]
                                                               stringByReplacingOccurrencesOfString:[@"%c2%bb" capitalizedString] withString:@"»"]
                                                              stringByReplacingOccurrencesOfString:[@"%c3%80" capitalizedString] withString:@"À"]
                                                             stringByReplacingOccurrencesOfString:[@"%c3%82" capitalizedString] withString:@"Â"]
                                                            stringByReplacingOccurrencesOfString:[@"%c3%84" capitalizedString] withString:@"Ä"]
                                                           stringByReplacingOccurrencesOfString:[@"%c3%86" capitalizedString] withString:@"Æ"]
                                                          stringByReplacingOccurrencesOfString:[@"%c3%87" capitalizedString] withString:@"Ç"]
                                                         stringByReplacingOccurrencesOfString:[@"%c3%88" capitalizedString] withString:@"È"]
                                                        stringByReplacingOccurrencesOfString:[@"%c3%89" capitalizedString] withString:@"É"]
                                                       stringByReplacingOccurrencesOfString:[@"%c3%8a" capitalizedString] withString:@"Ê"]
                                                      stringByReplacingOccurrencesOfString:[@"%c3%8b" capitalizedString] withString:@"Ë"]
                                                     stringByReplacingOccurrencesOfString:[@"%c3%8f" capitalizedString] withString:@"Ï"]
                                                    stringByReplacingOccurrencesOfString:[@"%c3%91" capitalizedString] withString:@"Ñ"]
                                                   stringByReplacingOccurrencesOfString:[@"%c3%94" capitalizedString] withString:@"Ô"]
                                                  stringByReplacingOccurrencesOfString:[@"%c3%96" capitalizedString] withString:@"Ö"]
                                                 stringByReplacingOccurrencesOfString:[@"%c3%9b" capitalizedString] withString:@"Û"]
                                                stringByReplacingOccurrencesOfString:[@"%c3%9c" capitalizedString] withString:@"Ü"]
                                               stringByReplacingOccurrencesOfString:[@"%c3%a0" capitalizedString] withString:@"à"]
                                              stringByReplacingOccurrencesOfString:[@"%c3%a2" capitalizedString] withString:@"â"]
                                             stringByReplacingOccurrencesOfString:[@"%c3%a4" capitalizedString] withString:@"ä"]
                                            stringByReplacingOccurrencesOfString:[@"%c3%a6" capitalizedString] withString:@"æ"]
                                           stringByReplacingOccurrencesOfString:[@"%c3%a7" capitalizedString] withString:@"ç"]
                                          stringByReplacingOccurrencesOfString:[@"%c3%a8" capitalizedString] withString:@"è"]
                                         stringByReplacingOccurrencesOfString:[@"%c3%a9" capitalizedString] withString:@"é"]
                                        stringByReplacingOccurrencesOfString:[@"%c3%af" capitalizedString] withString:@"ï"]
                                       stringByReplacingOccurrencesOfString:[@"%c3%b4" capitalizedString] withString:@"ô"]
                                      stringByReplacingOccurrencesOfString:[@"%c3%b6" capitalizedString] withString:@"ö"]
                                     stringByReplacingOccurrencesOfString:[@"%c3%bb" capitalizedString] withString:@"û"]
                                    stringByReplacingOccurrencesOfString:[@"%c3%bc" capitalizedString] withString:@"ü"]
                                   stringByReplacingOccurrencesOfString:[@"%c3%bf" capitalizedString] withString:@"ÿ"]
                                  stringByReplacingOccurrencesOfString:@"%20" withString:@" "];
    
    return isoEncodedString;
}

- (NSString *)sentenceCapitalizedString
{
    if(![self length])
    {
        return [NSString string];
    }
    NSString *uppercase = [[self substringToIndex:1] uppercaseString];
    NSString *lowercase = [[self substringFromIndex:1] lowercaseString];
    
    return [uppercase stringByAppendingString:lowercase];
}

- (NSString *)dateFromTimestamp
{
    NSString *year = [self substringToIndex:4];
    NSString *month = [[self substringFromIndex:5] substringToIndex:2];
    NSString *day = [[self substringFromIndex:8] substringToIndex:2];
    NSString *hours = [[self substringFromIndex:11] substringToIndex:2];
    NSString *minutes = [[self substringFromIndex:14] substringToIndex:2];
    
    return [NSString stringWithFormat:@"%@/%@/%@ %@:%@", day, month, year, hours, minutes];
}

- (NSString *)urlEncode
{
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *)[self UTF8String];
    int sourceLen = (int)strlen((const char *)source);
    for(int i = 0; i < sourceLen; ++i)
    {
        const unsigned char thisChar = source[i];
        
        if(thisChar == ' ')
        {
            [output appendString:@"+"];
        }
        else if(thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' || (thisChar >= 'a' && thisChar <= 'z') || (thisChar >= 'A' && thisChar <= 'Z') || (thisChar >= '0' && thisChar <= '9'))
        {
            [output appendFormat:@"%c", thisChar];
        }
        else
        {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    
    return output;
}


//判断字符串是否为空,为空返回无
-(NSString *)not_null{
    if (self==nil||[self isEqual:[NSNull new]]||(self==NULL) ||[self isEqualToString:@""]) {
        return @"";
    } else {
        
        return self;
    }
}


#pragma mark- 提取数字
+(NSString *)findNumFromStr:(NSString *)Text_str
{
    //
    //    if ([Text_str isEqualToString:@""]) {
    //        return -1;
    //    }
    
    
    NSString *originalString =Text_str;
    
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
    // Result.
    //    int number = [numberString integerValue];
    
    return numberString;
}
#pragma mark- 提取数字和字母
+(NSString *)findNumAndABC_Str:(NSString *)Text_str{
    
    NSString *originalString =Text_str;
    
    // Intermediate
    NSMutableString *numberString = [[NSMutableString alloc] init];
    NSString *tempStr;
    NSScanner *scanner = [NSScanner scannerWithString:originalString];
    NSCharacterSet *numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"];
    
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
    // Result.
    //    int number = [numberString integerValue];
    
    return numberString;
    
}
+(BOOL)is_11_phone_num:(NSString*)phone_str{
    
    if ([[phone_str not_null] isEqualToString:@""]) {
        return NO;
    }
    NSString*phone=[NSString findNumFromStr:phone_str];
    if ([[phone not_null] isEqualToString:@""]) {
        return NO;
    }
    if (phone.length!=11) {
        return NO;
    }
    if (![phone hasPrefix:@"1"]) {
        return NO;
    }
    
    
    return YES;
}
#pragma mark- 去掉所有空格
+(NSString *)Remove_blank_Str:(NSString *)Text_str{
    if ([[Text_str not_null] isEqualToString:@""]) {
        return @"";
    }
    
    //去掉搜索中所有空格
    NSString *seachtext = [Text_str stringByReplacingOccurrencesOfString:@" " withString:@""];
    return seachtext;
}

#pragma mark- ChineseToPinyin 获取汉字拼音
+ (NSString *)chineseToPinyin:(NSString *)chinese withSpace:(BOOL)withSpace {
    CFStringRef hanzi = (__bridge CFStringRef)chinese;
    CFMutableStringRef string = CFStringCreateMutableCopy(NULL, 0, hanzi);
    CFStringTransform(string, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform(string, NULL, kCFStringTransformStripDiacritics, NO);
    NSString *pinyin = (NSString *)CFBridgingRelease(string);
    if (!withSpace) {
        pinyin = [pinyin stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    return pinyin;
}

@end
