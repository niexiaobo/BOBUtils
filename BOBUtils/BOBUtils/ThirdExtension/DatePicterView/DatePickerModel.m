//
//  DatePickerModel.m
//  NXBDatePicker
//
//  Created by 博彦科技-聂小波 on 16/7/29.
//  Copyright © 2016年 聂小波. All rights reserved.
//

#import "DatePickerModel.h"

@implementation DatePickerModel

+ (NSString*)formatDateTime:(NSString*)dateTime {
    
    return [NSString stringWithFormat:@"%02ld",[dateTime integerValue]];
}

@end
