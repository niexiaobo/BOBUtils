//
//  YMDHMDatePickerView.m
//  NXBDatePicker
//
//  Created by 博彦科技-聂小波 on 16/7/29.
//  Copyright © 2016年 聂小波. All rights reserved.
//

#import "YMDHMDatePickerView.h"
#import "PickerTabbarView.h"
#import "UIView+BOBs.h"

#define Screen_height  [[UIScreen mainScreen] bounds].size.height
#define Screen_width  [[UIScreen mainScreen] bounds].size.width

@interface YMDHMDatePickerView()<UIPickerViewDataSource,UIPickerViewDelegate,PickerTabbarViewDelegate>
//遵循协议
@property (nonatomic,strong)UIPickerView * pickerView;//自定义pickerview
@property (nonatomic,strong)NSMutableArray * dayDate;//
@property (nonatomic,strong)NSMutableArray * minuteDate;//
@property (nonatomic,strong)NSMutableArray * yearDate;//
@property (nonatomic,strong)NSMutableArray * mouthDate;//
@property (nonatomic,strong)NSMutableArray * hourDate;//
@property (nonatomic,strong)DatePickerModel * timePickerModel;
@property (nonatomic,strong)DatePickerModel * currentTimePickerModel;
@property (nonatomic,strong)PickerTabbarView *tabbarView;

@property (nonatomic,strong)UIView *containerPickerView;
@end
@implementation YMDHMDatePickerView

- (void)drawPickerView {
    
    if (self) {
        self.frame = CGRectMake(0, 0, Screen_width, Screen_height);
        self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
        self.containerPickerView = [[UIView alloc]initWithFrame:CGRectMake(0, Screen_height - 300, Screen_width, 300)];
        self.containerPickerView.backgroundColor = [UIColor colorWithRed:(float)249/255.0 green:(float)249/255.0 blue:(float)249/255.0 alpha:1];
        self.containerPickerView.hidden = YES;
        [self addSubview:self.containerPickerView];
        
        [self.containerPickerView addSubview:self.tabbarView];
        
        
        //获取需要展示的数据
        [self loadData];
        
        // 初始化pickerView
        self.pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(15, 50, self.bounds.size.width -15, 300 - 50)];
        [self.containerPickerView addSubview:self.pickerView];
        
        //指定数据源和委托
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
        
        [self scrollToSelectDate];
        [self setupShow];
        
    }
}

- (PickerTabbarView *)tabbarView{
    if (!_tabbarView) {
        _tabbarView = [[PickerTabbarView alloc]init];
        [_tabbarView drawPickerTabbarViewRect:CGRectMake(0, 0, Screen_width, 50)];
        _tabbarView.delegate = self;
        
    }
    return _tabbarView;
}

#pragma mark- PickerTabbarViewDelegate
- (void)pickerTabbarButtonClick:(UIButton *)Button {

    if (Button.tag == 1) {//取消
        [self setupHidden];
        
    } else if (Button.tag == 2) {//确定
        [self setupHidden];
        [self SureButtonClick];
    }
}

#pragma mark- 加载数据
- (void)loadData{
    //需要展示的数据以数组的形式保存
    [self setupPickerDate];
    
}

#pragma mark - 初始化日期时间
- (void)setupPickerDate {
    
    self.yearDate = [[NSMutableArray alloc]init];
    self.mouthDate = [[NSMutableArray alloc]init];
    self.dayDate = [[NSMutableArray alloc]init];
    self.hourDate = [[NSMutableArray alloc]init];
    self.minuteDate = [[NSMutableArray alloc]init];
    [self getCurrentDate];
    self.timePickerModel = [[DatePickerModel alloc]init];
    self.timePickerModel = self.currentTimePickerModel;
    
    for (int i = 2016; i <= 2040; i ++) {
        [self.yearDate addObject:[NSString stringWithFormat:@"%.d",i]];
    }
    for (int i = 1; i <= 12; i ++) {
        [self.mouthDate addObject:[NSString stringWithFormat:@"%.d",i]];
    }
    
    int DayDateLen = [self getDayDateumber];
    
    for (int i = 1; i <= DayDateLen; i ++) {
        [self.dayDate addObject:[NSString stringWithFormat:@"%.d",i]];
    }
    for (int i = 1; i <= 24; i ++) {
        [self.hourDate addObject:[NSString stringWithFormat:@"%02d",i]];
    }
    for (int i = 0; i <= 59; i ++) {
        [self.minuteDate addObject:[NSString stringWithFormat:@"%02d",i]];
    }
    
    [self.pickerView reloadAllComponents];
    
}

#pragma mark - 滚动到特定时间位置
- (void)scrollToSelectDate {
    
    [self.pickerView selectRow:[self.timePickerModel.yearDate integerValue] - 2016 inComponent:0 animated:YES];
    [self.pickerView selectRow:[self.timePickerModel.mouthDate integerValue] - 1 inComponent:1 animated:YES];
    [self.pickerView selectRow:[self.timePickerModel.dayDate integerValue] - 1 inComponent:2 animated:YES];
    [self.pickerView selectRow:[self.timePickerModel.hourDate integerValue] - 1 inComponent:3 animated:YES];
    [self.pickerView selectRow:[self.timePickerModel.minuteDate integerValue] - 0 inComponent:4 animated:YES];
}

#pragma mark - 当前时间
- (void)getCurrentDate {
    /*
     当前时间对象[dateNow]
     */
    NSDate *dateNow = [NSDate date];
    
    /*
     日历类[calendar]
     注意: 一定要用[NSCalendar currentCalendar]初始化,
     如果用[[NSCalendar alloc] init]初始化, 获取的时间会是随机式.
     */
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    
    /*
     变量
     */
    NSInteger year;         //年
    NSInteger month;        //月
    NSInteger day;          //日
    NSInteger hour;         //时
    NSInteger minute;       //分
    NSInteger second;       //秒
    NSInteger nanosecond;   //10^-9秒
    
    
    /*
     使用[calendar]对象从[dateNow]中获取 [hour] [minute] [second] [nanosecond]
     注意: '&'是取地址符, 把变量的"地址"传过去,
     函数会把相应的值写入这个"地址", 我们的变量里面就存入相应的值了.
     */
    [calendar getHour:&hour minute:&minute second:&second nanosecond:&nanosecond fromDate:dateNow];
    
    [calendar getEra:nil year:&year month:&month day:&day fromDate:dateNow];
    
    
    NSLog(@"%.ld-%.ld-%.ld %.ld:%02ld:%02ld.%03ld", year, month, day, hour, minute, second, nanosecond/1000000);
    
    self.currentTimePickerModel = [[DatePickerModel alloc]init];
    self.currentTimePickerModel.yearDate = [NSString stringWithFormat:@"%.ld",year];
    self.currentTimePickerModel.mouthDate = [NSString stringWithFormat:@"%.ld",month];
    self.currentTimePickerModel.dayDate = [NSString stringWithFormat:@"%.ld",day];
    self.currentTimePickerModel.hourDate = [NSString stringWithFormat:@"%02ld",hour];
    self.currentTimePickerModel.minuteDate = [NSString stringWithFormat:@"%02ld",minute];
    
}

- (int)getDayDateumber {
    return [self updateDayDateYear:[self.currentTimePickerModel.yearDate intValue] chosenMonth:[self.currentTimePickerModel.mouthDate intValue]];
}

#pragma mark - 更新日期数据
- (int)updateDayDateYear:(int)chosenYear  chosenMonth:(int)chosenMonth{
    if ((chosenMonth == 1) || (chosenMonth == 3) || (chosenMonth == 5) ||(chosenMonth == 7)||(chosenMonth == 8)||(chosenMonth == 10)||(chosenMonth == 12))
    {
        return 31;
    }
    if ((chosenMonth == 4)||(chosenMonth == 6)||(chosenMonth == 9)||(chosenMonth == 11)) {
        return 30;
    }
    if ((chosenYear % 100 != 0)&(chosenYear % 4 == 0)) {
        return 29;
    }
    if ((chosenYear % 400 == 0)) {
        return 29;
    }
    return 28;
    
}

#pragma mark UIPickerView DataSource Method 数据源方法

#pragma mark - 指定pickerview有几个表盘
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 5;//第一个展示字母、第二个展示数字
}

#pragma mark - 指定每个表盘上有几行数据
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger result = 0;
    switch (component) {
        case 0:
            result = self.yearDate.count;//根据数组的元素个数返回几行数据
            break;
        case 1:
            result = self.mouthDate.count;
            break;
        case 2:
            result = self.dayDate.count;//根据数组的元素个数返回几行数据
            break;
        case 3:
            result = self.hourDate.count;
            break;
        case 4:
            result = self.minuteDate.count;
            break;
        default:
            break;
    }
    return result;
}

#pragma mark UIPickerView Delegate Method 代理方法
#pragma mark - UIPickerView Delegate Methods
- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view{
    
    
    
    UILabel *dateLabel = (UILabel *)view;
    dateLabel = [[UILabel alloc] init];
    [dateLabel setBackgroundColor:[UIColor clearColor]];
    
    NSString * title = nil;
    switch (component) {
        case 0:
            title = [NSString stringWithFormat:@"%@年",self.yearDate[row]];
            break;
        case 1:
            title = [NSString stringWithFormat:@"%@月",self.mouthDate[row]];
            break;
        case 2:
            title = [NSString stringWithFormat:@"%@日",self.dayDate[row]];
            break;
            
        case 3:
            title = [NSString stringWithFormat:@"%@时",self.hourDate[row]];
            break;
        case 4:
            title = [NSString stringWithFormat:@"%@分",self.minuteDate[row]];
            break;
        default:
            break;
    }
    
    [dateLabel setText:title];
    dateLabel.font = [UIFont systemFontOfSize:16];
    return dateLabel;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (component == 0) {
        self.timePickerModel.yearDate = self.yearDate[row];
    } else if (component == 1) {
        self.timePickerModel.mouthDate = self.mouthDate[row];
    } else if (component == 2) {
        self.timePickerModel.dayDate = self.dayDate[row];
        
    } else if (component == 3) {
        self.timePickerModel.hourDate = self.hourDate[row];
    } else if (component == 4) {
        self.timePickerModel.minuteDate = self.minuteDate[row];
    }
    
    if (component <= 1) {
        int chosenYear;
        int chosenMonth;
        
        if (component == 0) {
            chosenYear = [self.yearDate[row] intValue];
            chosenMonth = [self.timePickerModel.mouthDate intValue];
            
        } else if (component == 1) {
            chosenYear = [self.timePickerModel.yearDate intValue];
            chosenMonth = [self.mouthDate[row] intValue];
            
        }
        int DayDateLen = [self updateDayDateYear:chosenYear chosenMonth:chosenMonth];
        
        if ([self.timePickerModel.dayDate intValue] > DayDateLen) {
            self.timePickerModel.dayDate = [NSString stringWithFormat:@"%d",DayDateLen];
        }
        self.dayDate = [[NSMutableArray alloc]init];
        for (int i = 1; i <= DayDateLen; i ++) {
            [self.dayDate addObject:[NSString stringWithFormat:@"%d",i]];
        }
        [self.pickerView reloadAllComponents];
    }
    
    
}

#pragma mark - 隐藏自己
- (void)setupHidden {
    [UIView animateWithDuration:0.3 animations:^{
        self.containerPickerView.y = Screen_height;
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.containerPickerView.hidden = YES;
        self.hidden = YES;
    });
}

#pragma mark - 显示自己
- (void)setupShow {
    self.containerPickerView.y =  Screen_height;
    self.hidden = NO;
    self.containerPickerView.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.containerPickerView.y = Screen_height - 300;
        
    }];
}

#pragma mark - 标题
- (void)setupMsgLabel:(NSString*)message {
    self.tabbarView.msgLabel.text = message;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self endEditing:YES];
    [self setupHidden];
}

#pragma mark - 确定 事件
- (void)SureButtonClick {
    if ([self.delegate respondsToSelector:@selector(pickerViewSureButtonClick:)]) {
        [self.delegate pickerViewSureButtonClick:self.timePickerModel];
    }
}
@end
