//
//  PickerTabbarView.m
//  chengjubei
//
//  Created by 博彦科技-聂小波 on 16/7/29.
//  Copyright © 2016年 城俱杯. All rights reserved.
//

#import "PickerTabbarView.h"

@implementation PickerTabbarView

- (void)drawPickerTabbarViewRect:(CGRect)rect {
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.frame = rect;
        self.cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, rect.size.height, rect.size.height)];
        self.cancelBtn.tag = 1;
        [self setupButton:self.cancelBtn Title:@"取消" Color:[UIColor colorWithRed:(float)201/255.0 green:(float)52/255.0 blue:(float)21/255.0 alpha:1]];
        self.sureBtn = [[UIButton alloc]initWithFrame:CGRectMake(rect.size.width - rect.size.height, 0, rect.size.height, rect.size.height)];
        self.sureBtn.tag = 2;
        [self setupButton:self.sureBtn Title:@"确定" Color:[UIColor colorWithRed:(float)201/255.0 green:(float)52/255.0 blue:(float)21/255.0 alpha:1]];
        
        [self addSubview:self.cancelBtn];
        [self addSubview:self.sureBtn];
        
        self.msgLabel = [[UILabel alloc]initWithFrame:CGRectMake(rect.size.height, 0, rect.size.width - rect.size.height*2, rect.size.height)];
        self.msgLabel.textColor = [UIColor colorWithRed:(float)51/255.0 green:(float)51/255.0 blue:(float)51/255.0 alpha:1];
        self.msgLabel.font = [UIFont systemFontOfSize:16];
        self.msgLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.msgLabel];
    }
}

#pragma mark - 时间选择器 tabbar
- (void)setupButton:(UIButton*)Button  Title:(NSString*)Title  Color:(UIColor*)Color{
    [Button setTitle:Title forState:UIControlStateNormal];
    [Button setTitleColor:Color forState:UIControlStateNormal];
    [Button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];

}

#pragma mark - 按钮事件
- (void)buttonClick:(UIButton*)button {
    if ([self.delegate respondsToSelector:@selector(pickerTabbarButtonClick:)]) {
        [self.delegate pickerTabbarButtonClick:button];
    }
}

@end
