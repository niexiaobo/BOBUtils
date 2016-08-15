//
//  SystemSoundBOBs.m
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import "SystemSoundBOBs.h"

@implementation SystemSoundBOBs

+ (void)playSystemSound:(AudioID)audioID
{
    AudioServicesPlaySystemSound(audioID);
}

+ (void)playSystemSoundVibrate
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

@end
