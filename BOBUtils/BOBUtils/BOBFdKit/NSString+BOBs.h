//
//  NSString+BOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BOBs)
/**
 *  Example: "This is a test" with start char 'h' and end char 't' will return "his is a "
 */
+ (NSString *)searchInString:(NSString *)string
                   charStart:(char)start
                     charEnd:(char)end;
/**
 *  Example: "This is a test" with start char 'h' and end char 't' will return "his is a "
 */
- (NSString *)searchCharStart:(char)start
                      charEnd:(char)end;

/**
 *  Create a MD5 string from self
 */
- (NSString *)MD5;

/**
 *  Create a SHA1 string from self
 */
- (NSString *)SHA1;

/**
 *  Create a SHA256 string from self
 */
- (NSString *)SHA256;

/**
 *  Create a SHA512 string from self
 */

- (NSString *)SHA512;

/**
 *  Check if self has the given substring
 */
- (BOOL)hasString:(NSString *)substring;

/**
 *  Check if self is an email
 */

- (BOOL)isEmail;

/**
 *  Check if the given string is an email
 */
+ (BOOL)isEmail:(NSString *)email;

/**
 *  Convert a string to UTF8
 */
+ (NSString *)convertToUTF8Entities:(NSString *)string;

/**
 *  首字母大小写切换
 *  Example: "This is a Test" will return "This is a test" and "this is a test" will return "This is a test"
 */
- (NSString *)sentenceCapitalizedString;

/**
 *  Return a human legible string from a timestamp
 */
- (NSString *)dateFromTimestamp;

/**
 *  Encode self to an encoded url string
 */
- (NSString *)urlEncode;

#pragma mark- 判断字符串是否为空,为空返回 @""
-(NSString *)not_null;
#pragma mark- 提取数字
+(NSString *)findNumFromStr:(NSString *)Text_str;
#pragma mark- 提取数字和字母
+(NSString *)findNumAndABC_Str:(NSString *)Text_str;

#pragma mark- 11位手机号
+(BOOL)is_11_phone_num:(NSString*)phone_str;

#pragma mark- 去掉所有空格
+(NSString *)Remove_blank_Str:(NSString *)Text_str;

#pragma mark- ChineseToPinyin 获取汉字拼音
+ (NSString *)chineseToPinyin:(NSString *)chinese withSpace:(BOOL)withSpace;

@end
