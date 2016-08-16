//
//  DatePickerModel.h
//  NXBDatePicker
//
//  Created by 博彦科技-聂小波 on 16/7/29.
//  Copyright © 2016年 聂小波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DatePickerModel : NSObject

@property (nonatomic, copy) NSString *yearDate;
@property (nonatomic, copy) NSString *mouthDate;
@property (nonatomic, copy) NSString *dayDate;
@property (nonatomic, copy) NSString *hourDate;
@property (nonatomic, copy) NSString *minuteDate;

+ (NSString*)formatDateTime:(NSString*)dateTime;
@end
