//
//  SuggestionCollectScheduleCell.m
//  Templete
//
//  Created by beyondsoft-聂小波 on 16/8/22.
//  Copyright © 2016年 Bangko. All rights reserved.
//

#import "SuggestionCollectScheduleCell.h"

#define kScreen_Width [UIScreen mainScreen].bounds.size.width

//黑文本颜色3
#define darkColor_51 [UIColor colorWithRed:(float)51.0/255.0 green:(float)51.0/255.0 blue:(float)51.0/255.0 alpha:1]
#define GrayColor1_153 [UIColor colorWithRed:153/255.f green:153/255.f blue:153/255.f alpha:1]
#define GrayColor1_136 [UIColor colorWithRed:136.0/255.f green:136.0/255.f blue:136.0/255.f alpha:1]
#define GrayColor1_200 [UIColor colorWithRed:200.0/255.f green:200.0/255.f blue:200.0/255.f alpha:1]
#define BackgroundColor [UIColor colorWithRed:236/255.f green:236/255.f  blue:236/255.f  alpha:1]

@implementation SuggestionCollectScheduleCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"TestTableViewCell";
    
    SuggestionCollectScheduleCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[SuggestionCollectScheduleCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self awakeFromNib];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)awakeFromNib2 {
    // Initialization code
    //    cellheigh＝70
    float Heighta=70;//
    float Org_y=14;
    float Org_x=20;
    float lab_Heig=25;
    float lab_w=80;
    
    _imageIcon=[[UIImageView alloc]initWithFrame:CGRectMake(Org_x,Org_y+(lab_Heig-10)*0.5, 10, 10)];
    _imageIcon.image=[UIImage imageNamed:@"eventcm-bigorange"];
    
    _lineLeft=[[UIView alloc]initWithFrame:CGRectMake(Org_x+4,_imageIcon.frame.origin.y+10, 1, Heighta-(_imageIcon.frame.origin.y+10))];
    _lineLeft.backgroundColor=[UIColor colorWithRed:204.f/255.f green:204.f/255.f  blue:204.f/255.f  alpha:1];;
    
    Org_x+=27;
    //标题
    _StateLabel=[[UILabel alloc]initWithFrame:CGRectMake(Org_x, 0, lab_w, lab_Heig)];
    
    _StateLabel.frame=CGRectMake(Org_x, 0, kScreen_Width-Org_x-13, lab_Heig);
    
    _StateLabel.font=[UIFont systemFontOfSize:15];
    _StateLabel.textColor=GrayColor1_153;
    
    Org_y+=lab_Heig+5;
    //一行显示时间
    _timeLabelStar=[[UILabel alloc]initWithFrame:CGRectMake(Org_x, lab_Heig+5, 200, lab_Heig)];
    _timeLabelStar.font=[UIFont systemFontOfSize:16];
    _timeLabelStar.textColor=GrayColor1_153;
    
    
    Org_y+=lab_Heig+5;
    
    
    _detailLabel=[[UILabel alloc]initWithFrame:CGRectMake(Org_x, Org_y, kScreen_Width-Org_x-14, lab_Heig)];
    _detailLabel.font=[UIFont systemFontOfSize:15];
    _detailLabel.textColor=GrayColor1_153;
    _detailLabel.numberOfLines=0;
    
    //间隔线
    _lineBoom=[[UIView alloc]initWithFrame:CGRectMake(Org_x,Heighta - 1, kScreen_Width - Org_x - 15, 1)];
    _lineBoom.backgroundColor=BackgroundColor;
   
    [self addSubview:_lineLeft];
    [self addSubview:_imageIcon];
    
    [self addSubview:_timeLabelStar];
    [self addSubview:_StateLabel];
    [self addSubview:_detailLabel];
//    [self addSubview:_lineBoom];
    
}

- (void)awakeFromNib {
    // Initialization code
    // cellheigh＝70
    float Heighta=45;
    float Org_x=20;
    
    _imageIcon=[[UIImageView alloc]initWithFrame:CGRectMake(Org_x,(Heighta-10)*0.5, 10, 10)];
    _imageIcon.image=[UIImage imageNamed:@"eventcm-bigorange"];
    
    _lineLeft=[[UIView alloc]init];
    _lineLeft.backgroundColor=[UIColor colorWithRed:204.f/255.f green:204.f/255.f  blue:204.f/255.f  alpha:1];
    
    _lineLeftDown=[[UIView alloc]init];
    _lineLeftDown.backgroundColor = [UIColor colorWithRed:204.f/255.f green:204.f/255.f  blue:204.f/255.f  alpha:1];
    _lineLeftDown.hidden = YES;
    Org_x+=27;
    //标题
    _StateLabel=[[UILabel alloc]initWithFrame:CGRectMake(Org_x, 0, kScreen_Width-Org_x-13, Heighta)];
    _StateLabel.font=[UIFont systemFontOfSize:15];
    _StateLabel.textColor = GrayColor1_153;
    
    //间隔线
    _lineBoom=[[UIView alloc]initWithFrame:CGRectMake(Org_x,Heighta - 1, kScreen_Width - Org_x - 15, 1)];
    _lineBoom.backgroundColor = BackgroundColor;
    
    [self addSubview:_lineLeft];
    [self addSubview:_lineLeftDown];
    [self addSubview:_imageIcon];
    
    [self addSubview:_StateLabel];
    //    [self addSubview:_lineBoom];
    
}

-(void)update_frame:(float)deta_H index:(NSInteger)index is_big_org:(BOOL)is_big_org count:(NSInteger)count isGreenLine:(BOOL)isGreenLine {
    
    float Heighta=45;
    float Org_x = 20;
    float imgWmin = 13;
    float imgWmax = 17;
    float ORG_Y = 22.5;
    _lineLeft.hidden = NO;
    
    if (isGreenLine) {
        _lineLeft.backgroundColor = [UIColor colorWithRed:83.f/255.f green:184.f/255.f  blue:244.f/255.f  alpha:1];
        _lineLeftDown.backgroundColor =  _lineLeft.backgroundColor;
        _StateLabel.textColor = GrayColor1_136;
    } else {
        _lineLeft.backgroundColor = BackgroundColor;
        _lineLeftDown.backgroundColor = BackgroundColor;
        _StateLabel.textColor = GrayColor1_200;
    }
    
    float ORG_maxY = (Heighta + imgWmax)*0.5 + 1;
    float ORG_minH = (Heighta - imgWmax)*0.5 - 1;
    
    _lineLeft.frame=CGRectMake(Org_x + imgWmin / 2.0,0 , 1,ORG_minH);
    _lineLeftDown.frame=CGRectMake(Org_x + imgWmin / 2.0,ORG_maxY , 1,deta_H - ORG_maxY);
    _lineLeft.hidden = NO;
    _lineLeftDown.hidden = NO;
    if (index == 0) {
        _lineLeft.hidden = YES;
    } else if (index == count - 1) {
        _lineLeftDown.hidden = YES;
    }
    
    if (is_big_org) {
        //最后一个cell
        //大的圆
        _imageIcon.frame = CGRectMake(Org_x - (imgWmax - imgWmin)/2.0,(Heighta - imgWmax)*0.5, imgWmax, imgWmax);
        _imageIcon.image = [UIImage imageNamed:@"progressCircle1"];
        
    
        CGFloat datW = (imgWmax - imgWmin)/2.0;
        _lineLeft.height = ORG_minH - datW;
        _lineLeftDown.y = ORG_maxY + datW;
        _lineLeftDown.height = deta_H - ORG_maxY - datW;
        _lineLeftDown.backgroundColor = BackgroundColor;
        _lineLeft.backgroundColor = [UIColor colorWithRed:83.f/255.f green:184.f/255.f  blue:244.f/255.f  alpha:1];
        
        _StateLabel.textColor = darkColor_51;
    }else{
        //小的圆
        _imageIcon.frame=CGRectMake(Org_x, (Heighta - imgWmin)*0.5, imgWmin, imgWmin);
        _imageIcon.image=[UIImage imageNamed:@"progressCircle2"];
        
    }
}

@end
