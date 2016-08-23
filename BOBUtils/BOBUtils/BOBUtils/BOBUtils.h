//
//  BOBUtils.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <dirent.h>
#import <sys/stat.h>

typedef enum {
    NONE=0, //没有网络
    IS3G, //3G网络
    ISWIFI,  //
    ERROR //顺序循环
} NetWorkType;

typedef enum {
    WeekType=0,
    MonthType,
}TimeStateType;

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


+(NSString *)getDefaultFilePathString:(NSString *)fileName;

+(NSString *)getDocumentFilePathString:(NSString *)fileName;

+(NSString *)getLibraryFilePathString:(NSString *)fileName;

+(NSString *)getCacheFilePathString:(NSString *)fileName;

+(NSString *)getCachePathString;

+(NSString *)getTempPathString;

+(NSString *)getTempFilePathString:(NSString *)fileName;

+(NSString *)getResourceFilePathString:(NSString *) resourceName ofType:(NSString*)typeName;

#pragma mark -- ///删除目录下所有文件
+(void)removeFile:(NSString *)folderPath;

#pragma mark -- //获得存储文件的路径
+ (NSString *)getSaveFilePath:(NSString *)fileName;

#pragma mark -- ///保存文件
+ (void)saveFilePath:(NSString *)filepath fileData:(id)info andEncodeObjectKey:(NSString *)key;
#pragma mark -- ///读取文件
+ (NSData *)loadDataFromFile:(NSString *)fileName anddencodeObjectKey:(NSString *)key;
#pragma mark -- ///获得配置信息
+ (NSString *)loadClientVersionKey:(NSString *)key;

#pragma mark -- //文件是否存在在某路径下
+ (BOOL)isHaveFileAtPath:(NSString *)path;

#pragma mark -- //判断文件夹是否存在
+(BOOL)judgeFileExist:(NSString * )fileName;

+(long long) fileSizeAtPath:(NSString*) filePath;
+(long long)folderSize:(const char *)folderPath ;

+(NSInteger)weiBoCountWord:(NSString*)s;
#pragma mark -- //去掉前后空格
+ (NSString *) getDisposalStr:(NSString *)s;
+ (NSString *)md5:(NSData *)data;

#pragma mark -- //判断密码8-16位且同时包含数字和字母
+(BOOL)judgePassWordLegal:(NSString *)pass;
////判断是否是邮箱
//+(BOOL)isEmail:(NSString *)input;
#pragma mark -- //判断是否是手机号码
+(BOOL)isMobileNum:(NSString *)input;
#pragma mark -- //判断是否是身份证号码
+(BOOL)isIdentityCardNo:(NSString *)input;
#pragma mark -- //判断是否是邮编
+(BOOL)isYouBian:(NSString*)input;
#pragma mark -- /// 判断是不是数字
+(BOOL)isNumber:(NSString *)input;
#pragma mark-- ///密码 长度6-18位，只能包含字符、数字和下划线
+(BOOL)isPassWord:(NSString *)input;
#pragma mark--//判断是否是银行卡号
+(BOOL)isBankCardNumber:(NSString *)input;

#pragma mark -- ///  把 毫秒 转为时间 yyyy-mm-dd HH:mm:ss
+ (NSString *)millisecondConvertedToDay:(unsigned long long )time;

+ (NSString *)millisecondToDateByFormatter:(unsigned long long)time formattter:(NSString * ) format;

#pragma mark -- ///  把 秒 转为时间 yyyy-mm-dd HH:mm:ss
+ (NSString *)secondToDateByFormatter:(unsigned long long)time formattter:(NSString * ) format;

#pragma mark -- ///把字符串时间转为指定的格式
+ (NSString *)translateDateString:(NSString *)translateDateString format:(NSString *)format toFormat:(NSString *)tofarmt;
#pragma mark -- ///根据指定日期返回周几 从周日开始，周日为0
+ (NSString *)getWeekdayFromDate:(NSString *)dateStr formatter:(NSString *)matter;

+ (UIImage *)fixOrientation:(UIImage *)aImage;

#pragma mark -- //修改图片的size
+(UIImage*)scaleToSize:(UIImage*)img size:(CGSize)size;

+(NSString *)ToHex:(long long int)tmpid;

#pragma mark -- 得到日期开始和结束时间
+(NSArray *)getStartDayAndEndDay:(TimeStateType)type;

#pragma mark -- 时间戳转时间
+ (NSString *)getTimeByTimeString:(NSString *)timeString;

#pragma mark -- 将字符串转换为按照指定间隔分隔的字符串
+ (NSString *)translateToCardString:(NSString *)string interval:(NSInteger)interval;

#pragma mark -- 设置一段字符串显示两种颜色
+ (NSAttributedString *)getDifferentColorString:(NSString *)totalStr oneStr:(NSString *)oneStr color:(UIColor *)oneColor otherStr:(NSString *)otherStr ortherColor:(UIColor *)otherColor;

#pragma mark -- 设置一段字符串显示两种字体
+ (NSAttributedString *)getDifferentFontString:(NSString *)totalStr oneStr:(NSString *)oneStr font:(NSInteger)oneFont otherStr:(NSString *)otherStr ortherFont:(NSInteger)otherFont;

#pragma mark -- 设置一段字符串显示两种加横线
+(NSAttributedString *)getDifferentUnderLineString:(NSString *)totalStr andRange:(NSRange)myRange andLineColor:(UIColor *)lineColor;
//andLineColor:(UIColor *)lineColor;

#pragma mark -- 设置一段字符，显示不同的字体颜色
/*
 *info: @[@[string,color,font],@[string,color,font],@[string,color,font]]
 *totalStr:完整的字符串
 */
+ (NSAttributedString *)getDifferentFontStringWithTotalString:(NSString *)totalStr andInfo:(NSArray *)info;

+ (NSString *)getBankName:(NSString *)bankCode;
+ (NSString *)getBankLogo:(NSString *)bankCode;
+ (NSString *)getBankCardType:(NSString *)bankCardtype;

#pragma mark -- 将多个字符串的结合，按照指定的间隔符进行分割，拼接成一个字符串
+ (NSString *)stringByStepetorStr:(NSString *)str andInfo:(NSString *)info,...NS_REQUIRES_NIL_TERMINATION;
+ (NSMutableAttributedString *)getLineSpaceString:(NSString *)string lineSpace:(CGFloat)space alignment:(NSTextAlignment)alignment;

#pragma mark -- 返回一条线
+ (UILabel *)lineLabelWithFrame:(CGRect)frame color:(UIColor *)color;

#pragma mark -- UILabel设置文本颜色
+ (NSMutableAttributedString *)setTextColor:(UIColor *)textColor  withRange:(NSRange)textRange withString:(NSString *)string;

#pragma mark -- 判断数据是否为空或空对象
+ (BOOL)dataIsNull:(id)string;

#pragma mark -- 根据UIEvent 获取indexpath
+ (NSIndexPath*)getIndexPathBy:(UIEvent*)event inView:(UITableView*)view;

#pragma mark -- 打电话
+(void)callPeopleBy:(NSString*)call view:(UIView*)view;

#pragma mark -- 获取手机唯一ID
+ (NSString *)getDeviceIdentify;

#pragma mark -- /**获取手机名称、系统名称*/
+(NSMutableArray *)getPhoneInfo;

#pragma mark -- 获取网络图片
+(void)setImgUrl:(NSString *)imgUrl toImgView:(UIImageView *)imgView;

#pragma mark -- 获取按钮的网络图片
+(void)setBtnImgUrl:(NSString *)imgUrl toBtnImgView:(UIButton *)Btn;

#pragma mark - 剪贴图片
+(UIImage *)changeImg:(UIImage*)image;

#pragma mark - url转码解码
+ (NSString*)URLDecodedString:(NSString *)str;
+ (NSString *)URLEncodedString:(NSString *)str;

#pragma mark 过滤 符号
+(NSString*)changeStr:(NSString *)str;

#pragma mark---textfield输入框字数的限制
+(void)mTextFieldDidChangeLimitLetter:(UITextField *)textField andLimitLength:(NSInteger)mLengh;
#pragma mark---TextView 输入框字数的限制
+(void)mTextViewDicChangeRangeLimit:(UITextView *)textView andLimitLenth:(NSInteger)mLengh;
#pragma mark---修改textField placeholder的颜色
+(void)changeTextFieldPlaceholderColor:(UITextField *)textField;

#pragma mark---字符串的处理
+(NSString *)getChangeToFloatType:(NSString *)mStr;

#pragma mark--输入框只能输入一位小数
+(BOOL)isInputOnePoint:(UITextField *)textField;

#pragma mark--/** 判断当前输入的是不是数字*/
+ (BOOL)isNumberInTextField:(UITextField *)startPriceTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;


// 保存数据
+ (void)save:(NSString *)key data:(id)data;
// 加载数据
+ (id)load:(NSString *)key;
// 删除数据
+ (void)delete:(NSString *)key;










@end

//@interface NSData (parseJson)
//
//+(id)parseJson;
//
//@end

@interface UIView (MHScreenShot2)
- (UIImage *)screenshotMH;


@end
