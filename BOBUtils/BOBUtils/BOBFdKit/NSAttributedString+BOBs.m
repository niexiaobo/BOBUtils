//
//  NSAttributedString+BOBs.m
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import "NSAttributedString+BOBs.h"

#define Screen_height  [[UIScreen mainScreen] bounds].size.height
#define Screen_width  [[UIScreen mainScreen] bounds].size.width

@implementation NSAttributedString (BOBs)

#pragma mark - 格式化富文本 to 请求数据
+ (NSArray *)formatAttributedStringToSendArray:(NSAttributedString*)attributedString {
    NSMutableArray *sendArray = [[NSMutableArray alloc]init];
    NSMutableArray *sendImageArray = [[NSMutableArray alloc]init];
    NSMutableArray *rangeArray = [[NSMutableArray alloc]init];
    
    NSRange range = NSMakeRange(0, attributedString.length);
    [attributedString enumerateAttributesInRange:range options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(NSDictionary<NSString *,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
        NSDictionary *dic = attrs;
        
        NSTextAttachment *attachmentImage = [dic objectForKey:@"NSAttachment"];
        
        if (attachmentImage && attachmentImage.image) {
            //富文本里图片数据
            UIImage *image = attachmentImage.image;
            [sendImageArray addObject:image];
            
            [rangeArray addObject:[NSString stringWithFormat:@"%lu",(unsigned long)range.location]];
            NSLog(@"=====range.length======%lu===========",(unsigned long)range.length);
        }
    }];
    //文字
    NSAttributedString *AttributextText = [attributedString attributedSubstringFromRange:range];
    NSString *attribuString = [AttributextText string];
    NSLog(@"--attribuString-->%@<----",attribuString);
    
    NSInteger beginLocation = 0;
    for (int i = 0; i < rangeArray.count; i ++) {
        NSInteger rangLength = [rangeArray[i] integerValue]-beginLocation;
        NSString *testT = [attribuString substringWithRange:NSMakeRange(beginLocation, rangLength)];
        NSLog(@"---->%@<----text---->%@<----",rangeArray[i],testT);
        [sendArray addObject:[self sendDicWithType:@"text" detailString:testT]];
        
        [sendArray addObject:[self sendDicWithType:@"image" detailString:@""]];
        
        beginLocation = [rangeArray[i] integerValue];
    }
    if (beginLocation < attribuString.length) {
        beginLocation =  beginLocation == 0 ? 0 : beginLocation-1;
        NSString *testT2 = [attribuString substringWithRange:NSMakeRange(beginLocation, attribuString.length-beginLocation)];
        [sendArray addObject:[self sendDicWithType:@"text" detailString:testT2]];
        NSLog(@"----->%ld<-------text---->%@<----",(long)beginLocation,testT2);
    }
    return @[sendArray,sendImageArray];
}

#pragma mark - 添加数据方法
+ (NSMutableDictionary *)sendDicWithType:(NSString*)type detailString:(NSString*)detailString {
    NSMutableDictionary *sendDic = [[NSMutableDictionary alloc]init];
    [sendDic setObject:type forKey:@"type"];
    [sendDic setObject:detailString forKey:@"content"];
    return sendDic;
}

#pragma mark - 格式化 请求数据 to 富文本
+ (NSAttributedString *)formatModelDataToAttributedString:(NSArray *)dataArray {
    
    NSAttributedString *attributedString = [[NSAttributedString alloc]init];
    for (int i=0; i<dataArray.count; i++) {
        
        id object = dataArray[i];
        if ([object isKindOfClass:[NSString class]]) {
            attributedString = [self attributedString:attributedString addText:object];
        } else if ([object isKindOfClass:[UIImage class]]) {
            attributedString = [self attributedString:attributedString addImage:object];
        }
    }
    return attributedString;
}

#pragma mark - 富文本 段落样式
+ (void)setupParagraphStyle:(NSAttributedString *)attributedString {
    NSMutableAttributedString *MutattributedString = [attributedString mutableCopy];
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //行间距
    paragraphStyle.lineSpacing = 4.0;
    //段落间距
    paragraphStyle.paragraphSpacing = 4.0;
    [MutattributedString addAttribute:NSParagraphStyleAttributeName
                                value:paragraphStyle
                                range:NSMakeRange(0, attributedString.length)];
    
    attributedString = MutattributedString;
}

#pragma mark - 富文本 添加文本
+ (NSAttributedString *)attributedString:(NSAttributedString *)attributedString addText:(NSString *)text {
    NSMutableAttributedString *MutattributedString = [attributedString mutableCopy];
    NSMutableAttributedString *attribuText = [[NSMutableAttributedString alloc] initWithString:text attributes:nil];
    [MutattributedString appendAttributedString:attribuText];
    return MutattributedString;
}

#pragma mark - 富文本 添加图片
+ (NSAttributedString *)attributedString:(NSAttributedString *)attributedString addImage:(UIImage *)image {
    NSMutableAttributedString *MutattributedString = [attributedString mutableCopy];
    NSTextAttachment *imgTextAtta = [[NSTextAttachment alloc]init];
    imgTextAtta.image = image;
    imgTextAtta.bounds = [self scaleImage:image SizeToWidth:Screen_width];//适配屏幕宽度
    //图片转AttributedString
    NSAttributedString *imageAttribut = [NSAttributedString attributedStringWithAttachment:imgTextAtta];
    NSMutableAttributedString *addLineAttri = [[NSMutableAttributedString alloc] initWithString:@""];
    //    NSMutableAttributedString *addLineAttriTwo = [[NSMutableAttributedString alloc] initWithString:@"\n"];//换行
    
    [addLineAttri appendAttributedString:imageAttribut];
    //    [addLineAttri appendAttributedString:addLineAttriTwo];
    //插入图片
    [MutattributedString appendAttributedString:addLineAttri];
    return MutattributedString;
}

#pragma mark - 计算新的图片大小 适配屏幕宽度
//这里不涉及对图片实际数据的压缩，所以不用异步处理~
+ (CGRect)scaleImage:(UIImage*)image   SizeToWidth:(CGFloat)width {
    //缩放系数
    CGFloat factor = 1.0;
    //获取原本图片大小
    CGSize oriSize = [image size];
    
    //计算缩放系数
    if (oriSize.width > Screen_width) {
        factor = (CGFloat) (width / oriSize.width);
    }
    //创建新的Size
    CGRect newSize = CGRectMake(0, 0, oriSize.width * factor , oriSize.height * factor);
    return newSize;
}

#pragma mark - 写数据
+ (BOOL)wirte2File:(NSString *)fileName data:(NSData *)data {
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,  NSUserDomainMask,YES);
    NSString *ourDocumentPath =[documentPaths objectAtIndex:0];
    NSString *FileName=[ourDocumentPath stringByAppendingPathComponent:fileName];
    return [data writeToFile:FileName atomically:YES];
};

#pragma mark - 读数据
+ (id)readFile:(NSString *)fileName {
    NSData *data = [NSData dataWithContentsOfFile:fileName options:0 error:NULL];
    NSError *error;
    id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    return object;
}
@end
