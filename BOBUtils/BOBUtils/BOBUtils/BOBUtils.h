//
//  BOBUtils.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface BOBUtils : NSObject
// 计算label高度
+ (CGFloat)getHeight:(UIFont *)font
         withContent:(NSString *)content
               width:(CGFloat)width;

// 计算label宽度
+ (CGFloat)getWidth:(UIFont *)font
        withContent:(NSString *)content
             height:(CGFloat)height;

/**
 *获取正在编辑中的编辑框
 */
+ (UIView *)editingTextField:(UIView*) view;

#pragma mark 以下为格式化时间
/**
 @method 根据dateString解析时间（秒）
 @param value 待计算的字符串
 @result NSDate 时间
 */
+(NSString *)getFormateDateByHz:(NSString *)dateStr timeStr:(NSString *)timeStr;

+(NSString *)getFormateDateByNsdate:(NSDate *)date;

+(NSDate *)dateFormatterByNSString:(NSString *)dateString;

+(NSString *)dateFormatterByNSDate:(NSDate *)date;

/**
 @method 根据dateString解析时间（秒）
 @param value 待计算的字符串
 @result NSDate 时间
 */
+(NSDate *)dateFormatterByNSStringWithDetail:(NSString *)dateString;

/**
 @method 根据指定日期格式返回档期日期的字符串
 @param 日期格式比如“yyyy-MM-dd”
 @result 字符串日期
 */
+(NSString *)getNowDateWithFormat:(NSString*)format;

/**
 @method 通过Date 获得DateString
 @param 日期格式比如“yyyy-MM-dd”
 @result 字符串日期
 */
+(NSString*)getDateStringByDate:(NSDate*)date andFormatStr:(NSString*)formatStr;

#pragma mark- 提取数字
+(NSString *)findNumFromStr:(NSString *)textStr;


+ (int) compareDate:(NSDate *)todayDate startDate:(NSDate *)startDate;

/**
 @method  获得DateString
 @param timeStr:传入的原时间 formatStr:传入的时间字符串的格式 日期格式比如“yyyy-MM-dd”
 @result 返回友好的日期字符串
 */
+ (NSString*)getFanTimeStr:(NSString*)timeStr andFormatStr:(NSString*)formatStr;

/**
 @method 比较两时间 是否相隔大于 seconds 秒
 @param bigTimeStr:大时间 "yyyy-MM-dd HH:mm:ss" samllTimeStr: 小时间"yyyy-MM-dd HH:mm:ss" seconds:相隔时长（秒）
 @result 返回友好的日期字符串
 */
+ (BOOL) isTime:(NSString*)bigTimeStr greatThan:(NSString*)smallTimeStr forSeconds:(long)seconds;

//+ (NSString *)parseDateStrByDateNum:(int)num;
//
//+ (NSDate *)parseDateByDateNum:(int)num;

+ (NSDate *)parseDateByDateNum:(int)num andDate:(NSDate *)parseDate;
/**
 @method返回中文几月份
 */
+(NSString *)getFormateDateMouth:(NSString *)dateStr;

//返回时间"yyyy-MM-dd HH:mm
+(NSString *)getFormateDateAndTime:(NSString *)dateStr timeStr:(NSString *)timeStr;
//返回时间"MM-dd HH:mm
+(NSString *)dateFormatterChartString:(NSDate *)date;
//返回时间"MM-dd HH:mm
+(NSString *)dateFormatterChartStrings:(NSString *)date timeStrings:(NSString *)time;
//返回时间"yyyy-MM-dd
+(NSString *)dateFormatterSString:(NSString *)dateString;
#pragma mark- 格式化字符串"2015-12-11 12:13"
+(NSString*)formatDataAndTimeString:(NSString*)date TimeString:(NSString*)Time;
#pragma mark- 格式化字符串"2015.12.11"
+(NSString*)formatDataAndTimeString2:(NSString*)date;
#pragma mark- 格式化字符串"2015年12月11日"
+(NSString*)formatDataAndTimeString3:(NSString*)date;
/**
 @method 根据dateString解析时间（毫秒）
 @param value 待计算的字符串
 @result NSDate 时间
 */
+(NSDate *)dateFormatterByNSStringNew:(NSNumber *)dateString;

//判断字符串是否为空,为空返回无
+(NSString *)stringisNOTnull:(NSString *)string;
//判断字符串是否为空,为空返回无
+(BOOL)is_string_null:(NSString *)string;
//判断字符串是否为空,为空返回无
+(BOOL)is_string_not_null:(NSString *)string;
//判断对象是否为空,为空返回无
+(BOOL)is_object_not_NSNull:(id)object;
+(BOOL)is_object_NSNull:(id)object;
#pragma mark- 显示label时赋值


+(NSString *)Label_name:(id)string;
//是否是电话号码
+(BOOL)checkPhoneNumInput:(NSString *)mobileNum;
//将nsset按照某一字段排序
+(NSArray *)convertArray:(NSSet *)data orderKey:(NSString *)orderKey;
//设置圆角
+(void)setImgBounds:(UIView *)img radius:(CGFloat)radius;
//设置圆角，并指定是否 边框颜色透明isOpBorders
+(void)setImgBounds:(UIView *)img radius:(CGFloat)radius isOpBorders:(BOOL)isOpBorders;

+(void)setImgBoundsByLittle:(UIView *)img radius:(CGFloat)radius;
//计算高度 todo
+(float)getScaleHeightWithScaleWidth:(float)scaleWidth originalWidth:(NSNumber *)originalWidth originalHeight:(NSNumber *)originalHeigh;

+(UIButton *)getBackBtnStyle;

/**
 @method 设置btn
 @result UIColor btn样式
 */
+(UIButton *)getBtnStyle:(NSString *)title;

/**
 @method 解析json
 @param 解析数据
 @result id
 */
+(id)parseJson:(NSData *)data;

/**
 *@name 获取文件路径
 *@param fileName
 */
+(NSString *)getFilePath:(NSString *)fileName;


/**
 *@name 判断网络环境是否是wifi
 */
+(BOOL)isWifi;

/**
 *@name dic转化成json
 */
+ (NSString *)dic2Json:(NSDictionary *)dic;


/**
 *@name array转化成json
 */
+ (NSString *)array2Json:(NSArray *)array;
/**
 *@name NSMutarray转化成json
 */
+ (NSString *)Mutarray2Json:(NSMutableArray *)array;
/**
 *@name dic转化成data
 */
+ (NSData *)dic2Data:(NSDictionary *)dic;

/**
 *@name 下载文件，视频，音乐
 */
+ (void)downloadFile:(NSString *)fileName len:(long long)len url:(NSString *)url;

/**
 *@name 设置nil str
 *@param str
 */
+ (NSString *)setEmptyStr:(NSString *)str;

#pragma mark- 区县地址，分户id
+(NSString *)Hbp_address_ValuesDiction_Hbpkey:(NSString *)Hbpkey;
#pragma mark- 报修状态
+(NSString *)Repair_ValuesDiction_key:(NSString *)key;
#pragma mark- 报修状态按钮背景
+(NSString *)Repair_image_Diction_key:(NSString *)key;
#pragma mark- 报修状态字典
+(NSDictionary *)Repair_ValuesDiction;
#pragma mark- 随手拍状态
+(NSString *)WuyePhoto_ValuesDiction_key:(NSString *)key;
#pragma mark- 随手拍状态按钮背景2
+(NSString *)WuyePhoto_state_image_Diction_key:(NSString *)key;
#pragma mark- 随手拍状态按钮背景
+(NSString *)WuyePhoto_image_Diction_key:(NSString *)key;




#pragma mark- 存储数据－本地缓存
+ (void)saveCache:(int)type andID:(int)_id andObject:(id)Object;
+ (id)getCache:(int)type andID:(int)_id;


#pragma mark - 设置btn稍后可点击
+ (void)setBtnEnableLater:(UIButton *)sender ctr:(UIViewController *)ctr;

+ (void)setBtnCanEnable:(UIButton *)sender;

/**
 *@name 判断是否登录
 *@return YES 已登录
 */
+ (BOOL)isLoginState;

/**
 *@name 判断是否vip
 *@return
 */
+ (BOOL)isVipState;

/**
 *@name 重新登录
 *@return
 */
+ (void)relogin;

/**
 *@name 获取带sid的url
 *@name 基础url
 *@return 转换后的url
 */
+ (NSString *)getSidUrl:(NSString *)baseUrl;


//获取机型
//+ (NSString*)getDeviceVersion;
//
////获取机型
//+ (NSString *) platformString;

//通过文件存储
+ (BOOL)wirte2File:(NSString *)fileName data:(NSData *)data;

+ (id)readFile:(NSString *)fileName;

//压缩图片
+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;
#pragma mark- 返回文本的frame，（计算高度）
+(CGRect)CGframe:(NSString *)string X:(CGFloat)X Y:(CGFloat)Y width:(CGFloat)width FontOfSize:(CGFloat)Font;
#pragma mark- 判断文本的宽度
+(CGFloat)getWidthtstr:(NSString *)str allowSize:(CGFloat)height font:(CGFloat)font;

+(CGSize)getHeightSize:(NSString *)str allowSize:(CGSize)size optionDic:(NSDictionary *)tdic1;
//判断是否为整形
+(BOOL)isPureInt:(NSString*)string;
//判断是否为11位数字
+(BOOL)is_11_Mobile:(NSString*)string;
#pragma mark- 手机号123****345
+(NSString*)phone_nub_reset:(NSString*)phone;

#pragma mark- 拨打电话
+(void)call_phone_atVC:(UIViewController*)viewC phoneNO:(NSString*)phoneNO;


#pragma mark- 字典添加元素
+(void)Dictionary:(NSMutableDictionary *)dic setobject:(id)object Forkey:(NSString *)Key;
#pragma mark- 字典添加元素
+(void)dictionary:(NSMutableDictionary *)dic setObject:(id)object forKey:(NSString *)Key;
+(BOOL)validateMobile:(NSString *)mobileNum;

+ (NSMutableDictionary *)getHbpDic;

//textfield.text 编码
+(NSString*)Unicode_str:(NSString*)str;

#pragma mark- NSString 四位一个空格
+(NSString *)countNumAndChangeformat:(NSString *)num;




@end

//@interface NSData (parseJson)
//
//+(id)parseJson;
//
//@end

@interface UIView (MHScreenShot2)
- (UIImage *)screenshotMH;


@end
