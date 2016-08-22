//
//  SuggestionCollectScheduleCell.h
//  Templete
//
//  Created by beyondsoft-聂小波 on 16/8/22.
//  Copyright © 2016年 Bangko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+BOBs.h"

@interface SuggestionCollectScheduleCell : UITableViewCell
@property (nonatomic, strong) UIImageView *imageIcon;
@property (nonatomic, strong) UILabel *timeLabelStar;
@property (nonatomic, strong) UILabel *timeLabelEnd;
@property (nonatomic, strong) UILabel *StateLabel;

@property (nonatomic, strong) UIView *lineLeft;
@property (nonatomic, strong) UIView *lineLeftDown;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIView *lineBoom;

-(void)update_frame:(float)deta_H index:(NSInteger)index is_big_org:(BOOL)is_big_org count:(NSInteger)count isGreenLine:(BOOL)isGreenLine;

/* 引用方法
 
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
 
 static NSString *ID = @"SuggestionCollectScheduleCell";
 SuggestionCollectScheduleCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
 if (!cell) {
 cell = [[SuggestionCollectScheduleCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];;
 }
 SuggestionProgressModel *ProgressModel = self.progressSectionModel.progressArray[indexPath.row];
 
 cell.StateLabel.text = ProgressModel.step_name;
 
 [cell update_frame:45.0 index:indexPath.row is_big_org:[ProgressModel.step_no isEqualToString:self.progressSectionModel.currentStep_name] count:self.progressSectionModel.progressArray.count isGreenLine:[ProgressModel.step_no integerValue] < [self.progressSectionModel.currentStep_name integerValue]];
 
 
 return cell;
 
 }
 
 */





@end
