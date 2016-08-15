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
 *  Search in a given string a substring from the start char to the end char.
 *  Example: "This is a test" with start char 'h' and end char 't' will return "his is a "
 *
 *  @param string The string to search in
 *  @param start  The start char
 *  @param end    The end char
 *
 *  @return
 */
+ (NSString *)searchInString:(NSString *)string
                   charStart:(char)start
                     charEnd:(char)end;

/**
 *  Search in self for a substring from the start char to the end char.
 *  Example: "This is a test" with start char 'h' and end char 't' will return "his is a "
 *
 *  @param start  The start char
 *  @param end    The end char
 *
 *  @return
 */
- (NSString *)searchCharStart:(char)start
                      charEnd:(char)end;

/**
 *  Create a MD5 string from self
 *
 *  @return Return the MD5 NSString from self
 */
- (NSString *)MD5;

/**
 *  Create a SHA1 string from self
 *
 *  @return Return the SHA1 NSString from self
 */
- (NSString *)SHA1;

/**
 *  Create a SHA256 string from self
 *
 *  @return Return the SHA256 NSString from self
 */
- (NSString *)SHA256;

/**
 *  Create a SHA512 string from self
 *
 *  @return Return the SHA512 NSString from self
 */

- (NSString *)SHA512;

/**
 *  Check if self has the given substring
 *
 *  @param substring The substring to be searched
 *
 *  @return Return YES if founded, NO if not
 */
- (BOOL)hasString:(NSString *)substring;

/**
 *  Check if self is an email
 *
 *  @return Return YES if it's an email, NO if not
 */

- (BOOL)isEmail;

/**
 *  Check if the given string is an email
 *
 *  @param email The string to be checked
 *
 *  @return Return YES if it's an email, NO if not
 */
+ (BOOL)isEmail:(NSString *)email;

/**
 *  Convert a string to UTF8
 *
 *  @param string String to be converted
 *
 *  @return Return the converted string
 */
+ (NSString *)convertToUTF8Entities:(NSString *)string;

/**
 *  Conver self to a capitalized string.
 *  Example: "This is a Test" will return "This is a test" and "this is a test" will return "This is a test"
 *
 *  @return Return the capitalized sentence string
 */
- (NSString *)sentenceCapitalizedString;

/**
 *  Return a human legible string from a timestamp
 *
 *  @return Return a human legible string from a timestamp
 */
- (NSString *)dateFromTimestamp;

/**
 *  Encode self to an encoded url string
 *
 *  @return Return the encoded NSString
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
@end
