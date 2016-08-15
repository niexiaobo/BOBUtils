//
//  SystemSoundBOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

/**
 *  Audio IDs enum. It's not all IDs
 */
typedef NS_ENUM(NSInteger, AudioID)
{
    AudioIDNewMail = 1000,
    AudioIDMailSent = 1001,
    AudioIDVoiceMail = 1002,
    AudioIDRecivedMessage = 1003,
    AudioIDSentMessage = 1004,
    AudioIDAlarm = 1005,
    AudioIDLowPower = 1006,
    AudioIDSMSReceived1 = 1007,
    AudioIDSMSReceived2 = 1008,
    AudioIDSMSReceived3 = 1009,
    AudioIDSMSReceived4 = 1010,
    AudioIDSMSReceived5 = 1013,
    AudioIDSMSReceived6 = 1014,
    AudioIDTweetSent = 1016,
    AudioIDAnticipate = 1020,
    AudioIDBloom = 1021,
    AudioIDCalypso = 1022,
    AudioIDChooChoo = 1023,
    AudioIDDescent = 1024,
    AudioIDFanfare = 1025,
    AudioIDLadder = 1026,
    AudioIDMinuet = 1027,
    AudioIDNewsFlash = 1028,
    AudioIDNoir = 1029,
    AudioIDSherwoodForest = 1030,
    AudioIDSpell = 1031,
    AudioIDSuspence = 1032,
    AudioIDTelegraph = 1033,
    AudioIDTiptoes = 1034,
    AudioIDTypewriters = 1035,
    AudioIDUpdate = 1036,
    AudioIDTink = 1057,
    AudioIDCTBusy = 1070,
    AudioIDCTCongestion = 1071,
    AudioIDCTPathACK = 1072,
    AudioIDCTError = 1073,
    AudioIDCTCallWaiting = 1074,
    AudioIDCTKeytone = 1075,
    AudioIDLock = 1100,
    AudioIDUnlock = 1101,
    AudioIDTock = 1105,
    AudioIDBeepBeep = 1106,
    AudioIDRingerCharged = 1107,
    AudioIDPhotoShutter = 1108,
    AudioIDShake = 1109,
    AudioIDJBLBegin = 1110,
    AudioIDJBLConfirm = 1111,
    AudioIDJBLCancel = 1112,
    AudioIDJBLNoMatch = 1113,
    AudioIDBeginVideoRecord = 1117,
    AudioIDEndVideoRecord = 1118
};

@interface SystemSoundBOBs : NSObject
/**
 *  Play a system sound from the ID
 *
 *  @param audioID ID of system audio from the AudioID enum
 */
+ (void)playSystemSound:(AudioID)audioID;

/**
 *  Play system sound vibrate
 */
+ (void)playSystemSoundVibrate;

@end
