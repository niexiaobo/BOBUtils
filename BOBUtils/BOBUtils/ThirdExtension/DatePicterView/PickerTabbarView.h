//
//  PickerTabbarView.h
//  chengjubei
//
//  Created by 博彦科技-聂小波 on 16/7/29.
//  Copyright © 2016年 城俱杯. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PickerTabbarViewDelegate <NSObject>
- (void)pickerTabbarButtonClick:(UIButton *)Button;
@end

@interface PickerTabbarView : UIView
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) UIButton *sureBtn;
@property (nonatomic, strong) UILabel *msgLabel;

@property(nonatomic, weak) id<PickerTabbarViewDelegate> delegate;

- (void)drawPickerTabbarViewRect:(CGRect)rect;

@end
