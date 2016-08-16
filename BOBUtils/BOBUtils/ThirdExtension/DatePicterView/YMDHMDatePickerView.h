//
//  YMDHMDatePickerView.h
//  NXBDatePicker
//
//  Created by 博彦科技-聂小波 on 16/7/29.
//  Copyright © 2016年 聂小波. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatePickerModel.h"

@protocol YMDHMDatePickerViewDelegate <NSObject>
- (void)pickerViewSureButtonClick:(DatePickerModel *)datePickerModel;
@end

@interface YMDHMDatePickerView : UIView

@property(nonatomic, weak) id<YMDHMDatePickerViewDelegate> delegate;

- (void)drawPickerView;
- (void)setupShow;
- (void)setupHidden;
- (void)setupMsgLabel:(NSString*)message;
@end
