//
//  NSFileManager+BOBs.h
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
/**
 *  Directory type enum
 */
typedef NS_ENUM(NSInteger, DirectoryType)
{
    DirectoryTypeMainBundle = 0,
    DirectoryTypeLibrary,
    DirectoryTypeDocuments,
    DirectoryTypeCache
};
@interface NSFileManager (BOBs)

+ (NSString *)readTextFile:(NSString *)file
                    ofType:(NSString *)type;

+ (BOOL)saveArrayToPath:(DirectoryType)path
           withFilename:(NSString *)fileName
                  array:(NSArray *)array;

+ (NSArray *)loadArrayFromPath:(DirectoryType)path
                  withFilename:(NSString *)fileName;

+ (NSString *)getBundlePathForFile:(NSString *)fileName;

+ (NSString *)getDocumentsDirectoryForFile:(NSString *)fileName;

+ (NSString *)getLibraryDirectoryForFile:(NSString *)fileName;

+ (NSString *)getCacheDirectoryForFile:(NSString *)fileName;

+ (BOOL)deleteFile:(NSString *)fileName fromDirectory:(DirectoryType)directory;

+ (BOOL)moveLocalFile:(NSString *)fileName
        fromDirectory:(DirectoryType)origin
          toDirectory:(DirectoryType)destination;

+ (BOOL)moveLocalFile:(NSString *)fileName
        fromDirectory:(DirectoryType)origin
          toDirectory:(DirectoryType)destination
       withFolderName:(NSString *)folderName;

+ (BOOL)duplicateFileAtPath:(NSString *)origin
                  toNewPath:(NSString *)destination;

+ (BOOL)renameFileFromDirectory:(DirectoryType)origin
                         atPath:(NSString *)path
                    withOldName:(NSString *)oldName
                     andNewName:(NSString *)newName;

+ (id)getAppSettingsForObjectWithKey:(NSString *)objKey;

+ (BOOL)setAppSettingsForObject:(id)value
                         forKey:(NSString *)objKey;

+ (id)getSettings:(NSString *)settings
     objectForKey:(NSString *)objKey;

+ (BOOL)setSettings:(NSString *)settings
             object:(id)value forKey:(NSString *)objKey;

#pragma mark - 保存数据到NSUserDefaults
+ (void)saveNSUserDefaults:(NSMutableDictionary*)detailDataDic forKey:(NSString*)Vkey;

#pragma mark-从NSUserDefaults中读取数据
+ (NSArray*)readNSUserDefaultsForKey:(NSString*)Vkey;

#pragma mark- 删除 临时编辑数据
+ (void)DeleteUserDefaultsDataForKey:(NSString*)Vkey;

#pragma mark- 保存图片文件 返回沙盒 存储地址数组
+ (NSMutableArray *)saveImageArray:(NSArray*)imageArray;

#pragma mark- 沙盒存储地址 中 获取image图片文件
+ (UIImage*)getImageFileWithName:(NSString*)filePath;

+ (UIImage *)handleImage:(UIImage *)originalImage withSize:(CGSize)size;


@end
