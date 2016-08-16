//
//  NSAttributedString+BOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (BOBs)

#pragma mark - 格式化富文本 to 请求数据
+ (NSArray *)formatAttributedStringToSendArray:(NSAttributedString*)attributedString;
#pragma mark - 格式化 请求数据 to 富文本
+ (NSAttributedString *)formatModelDataToAttributedString:(NSArray *)dataArray;
#pragma mark - 计算新的图片大小 适配屏幕宽度
//这里不涉及对图片实际数据的压缩，所以不用异步处理~
+ (CGRect)scaleImage:(UIImage*)image   SizeToWidth:(CGFloat)width;
#pragma mark - 富文本 添加图片
+ (NSAttributedString *)attributedString:(NSAttributedString *)attributedString addImage:(UIImage *)image;
#pragma mark - 富文本 段落样式
+ (void)setupParagraphStyle:(NSAttributedString *)attributedString;

@end
