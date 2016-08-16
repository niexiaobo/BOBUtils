//
//  NSFileManager+BOBs.m
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import "NSFileManager+BOBs.h"

#define APP_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

@implementation NSFileManager (BOBs)
+ (NSString *)readTextFile:(NSString *)file ofType:(NSString *)type
{
    NSString *temp = [[NSBundle mainBundle] pathForResource:file ofType:type];
    file = [NSString stringWithContentsOfFile:temp encoding:NSStringEncodingConversionAllowLossy error:nil];
    return file;
}

+ (BOOL)saveArrayToPath:(DirectoryType)path withFilename:(NSString *)fileName array:(NSArray *)array
{
    NSString *_path;
    
    switch(path)
    {
        case DirectoryTypeMainBundle:
            _path = [self getBundlePathForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeLibrary:
            _path = [self getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeDocuments:
            _path = [self getDocumentsDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeCache:
            _path = [self getCacheDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        default:
            break;
    }
    
    //NSLog(@"savedArrayToFile : %@",path);
    return [NSKeyedArchiver archiveRootObject:array toFile:_path];
}

+ (NSArray *)loadArrayFromPath:(DirectoryType)path withFilename:(NSString *)fileName
{
    NSString *_path;
    
    switch(path)
    {
        case DirectoryTypeMainBundle:
            _path = [self getBundlePathForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeLibrary:
            _path = [self getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeDocuments:
            _path = [self getDocumentsDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeCache:
            _path = [self getCacheDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        default:
            break;
    }
    
    //NSLog(@"loadedArrayFromFile : %@",_path);
    return [NSKeyedUnarchiver unarchiveObjectWithFile:_path];
}

+ (NSString *)getBundlePathForFile:(NSString *)fileName
{
    NSString *fileExtension = [fileName pathExtension];
    return [[NSBundle mainBundle] pathForResource:[fileName stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@".%@", fileExtension] withString:@""] ofType:fileExtension];
}

+ (NSString *)getDocumentsDirectoryForFile:(NSString *)fileName
{
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/", fileName]];
}

+ (NSString *)getLibraryDirectoryForFile:(NSString *)fileName
{
    NSString *libraryDirectory = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [libraryDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/", fileName]];
}

+ (NSString *)getCacheDirectoryForFile:(NSString *)fileName
{
    NSString *cacheDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [cacheDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/", fileName]];
}

+ (BOOL)deleteFile:(NSString *)fileName fromDirectory:(DirectoryType)directory
{
    if(fileName.length > 0)
    {
        NSString *path;
        
        switch(directory)
        {
            case DirectoryTypeMainBundle:
                path = [self getBundlePathForFile:fileName];
                break;
            case DirectoryTypeLibrary:
                path = [self getLibraryDirectoryForFile:fileName];
                break;
            case DirectoryTypeDocuments:
                path = [self getDocumentsDirectoryForFile:fileName];
                break;
            case DirectoryTypeCache:
                path = [self getCacheDirectoryForFile:fileName];
                break;
            default:
                break;
        }
        
        if([[NSFileManager defaultManager] fileExistsAtPath:path])
        {
            return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
        }
        else
        {
            return NO;
        }
    }
    
    return NO;
}

+ (BOOL)moveLocalFile:(NSString *)fileName fromDirectory:(DirectoryType)origin toDirectory:(DirectoryType)destination
{
    return [self moveLocalFile:fileName fromDirectory:origin toDirectory:destination withFolderName:nil];
}

+ (BOOL)moveLocalFile:(NSString *)fileName fromDirectory:(DirectoryType)origin toDirectory:(DirectoryType)destination withFolderName:(NSString *)folderName
{
    NSString *originPath;
    
    switch(origin)
    {
        case DirectoryTypeMainBundle:
            originPath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
            break;
        case DirectoryTypeLibrary:
            originPath = [self getDocumentsDirectoryForFile:fileName];
            break;
        case DirectoryTypeDocuments:
            originPath = [self getLibraryDirectoryForFile:fileName];
            break;
        case DirectoryTypeCache:
            originPath = [self getCacheDirectoryForFile:fileName];
            break;
        default:
            break;
    }
    
    NSString *destinationPath;
    
    switch(destination)
    {
        case DirectoryTypeMainBundle:
            if(folderName)
                destinationPath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@/%@", folderName, fileName] ofType:nil];
            else
                destinationPath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
            break;
        case DirectoryTypeLibrary:
            if(folderName)
                destinationPath = [self getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@/%@", folderName, fileName]];
            else
                destinationPath = [self getLibraryDirectoryForFile:fileName];
            break;
        case DirectoryTypeDocuments:
            if(folderName)
                destinationPath = [self getDocumentsDirectoryForFile:[NSString stringWithFormat:@"%@/%@", folderName, fileName]];
            else
                destinationPath = [self getDocumentsDirectoryForFile:fileName];
            break;
        case DirectoryTypeCache:
            if(folderName)
                destinationPath = [self getCacheDirectoryForFile:[NSString stringWithFormat:@"%@/%@", folderName, fileName]];
            else
                destinationPath = [self getCacheDirectoryForFile:fileName];
            break;
        default:
            break;
    }
    
    // Check if folder exist, if not, create automatically
    if(folderName)
    {
        NSString *folderPath = [NSString stringWithFormat:@"%@/%@", destinationPath, folderName];
        if(![[NSFileManager defaultManager] fileExistsAtPath:folderPath])
        {
            [[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:NO attributes:nil error:nil];
        }
    }
    
    BOOL copied = NO, deleted = NO;
    
    if([[NSFileManager defaultManager] fileExistsAtPath:originPath])
    {
        if([[NSFileManager defaultManager] copyItemAtPath:originPath toPath:destinationPath error:nil])
            copied = YES;
    }
    
    if(destination != DirectoryTypeMainBundle)
    {
        if([[NSFileManager defaultManager] fileExistsAtPath:originPath])
            if([[NSFileManager defaultManager] removeItemAtPath:originPath error:nil])
                deleted = YES;
    }
    
    if(copied && deleted)
        return YES;
    else
        return NO;
}

+ (BOOL)duplicateFileAtPath:(NSString *)origin toNewPath:(NSString *)destination
{
    if([[NSFileManager defaultManager] fileExistsAtPath:origin])
        return [[NSFileManager defaultManager] copyItemAtPath:origin toPath:destination error:nil];
    else
        return NO;
}

+ (BOOL)renameFileFromDirectory:(DirectoryType)origin atPath:(NSString *)path withOldName:(NSString *)oldName andNewName:(NSString *)newName
{
    NSString *originPath;
    
    switch(origin)
    {
        case DirectoryTypeMainBundle:
            originPath = [[NSBundle mainBundle] pathForResource:path ofType:nil];
            break;
        case DirectoryTypeLibrary:
            originPath = [self getDocumentsDirectoryForFile:path];
            break;
        case DirectoryTypeDocuments:
            originPath = [self getLibraryDirectoryForFile:path];
            break;
        case DirectoryTypeCache:
            originPath = [self getCacheDirectoryForFile:path];
            break;
        default:
            break;
    }
    
    if([[NSFileManager defaultManager] fileExistsAtPath:originPath])
    {
        NSString *newNamePath = [originPath stringByReplacingOccurrencesOfString:oldName withString:newName];
        if([[NSFileManager defaultManager] copyItemAtPath:originPath toPath:newNamePath error:nil])
        {
            if([[NSFileManager defaultManager] removeItemAtPath:originPath error:nil])
                return YES;
            else
                return NO;
        }
        else
            return NO;
    }
    else
        return NO;
}

+ (id)getAppSettingsForObjectWithKey:(NSString *)objKey
{
    return [self getSettings:APP_NAME objectForKey:objKey];
}

+ (BOOL)setAppSettingsForObject:(id)value forKey:(NSString *)objKey
{
    return [self setSettings:APP_NAME object:value forKey:objKey];
}

+ (id)getSettings:(NSString *)settings objectForKey:(NSString *)objKey
{
    NSString *path = [self getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@-Settings.plist", settings]];
    NSDictionary *loadedPlist = [NSDictionary dictionaryWithContentsOfFile:path];
    if(![[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@-Settings", settings] ofType:@"plist"];
        [self moveLocalFile:[NSString stringWithFormat:@"%@-Settings.plist", settings] fromDirectory:DirectoryTypeMainBundle toDirectory:DirectoryTypeLibrary withFolderName:@""];
        loadedPlist = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    }
    
    return [loadedPlist objectForKey:objKey];
}

+ (BOOL)setSettings:(NSString *)settings object:(id)value forKey:(NSString *)objKey
{
    NSString *path = [self getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@-Settings.plist", settings]];
    NSMutableDictionary *loadedPlist = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    if(![[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@-Settings", settings] ofType:@"plist"];
        [self moveLocalFile:[NSString stringWithFormat:@"%@-Settings.plist", settings] fromDirectory:DirectoryTypeMainBundle toDirectory:DirectoryTypeLibrary withFolderName:@""];
        loadedPlist = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    }
    
    [loadedPlist setObject:value forKey:objKey];
    return [loadedPlist writeToFile:path atomically:YES];
}

#pragma mark - 保存数据到NSUserDefaults
+ (void)saveNSUserDefaults:(NSMutableDictionary*)detailDataDic forKey:(NSString*)Vkey {
    
    //将上述数据全部存储到NSUserDefaults中
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if ([self readNSUserDefaultsForKey:Vkey]) {
        [userDefaults removeObjectForKey:Vkey];
        [userDefaults synchronize];
    }
    //存储时，除NSNumber类型使用对应的类型意外，其他的都是使用setObject:forKey:
    [userDefaults setObject:detailDataDic forKey:Vkey];
    //这里建议同步存储到磁盘中
    [userDefaults synchronize];
    
}

#pragma mark-从NSUserDefaults中读取数据
+ (NSArray*)readNSUserDefaultsForKey:(NSString*)Vkey {
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    NSArray*userDefaultArray = [userDefaultes objectForKey:Vkey];
    
    return userDefaultArray;
}

#pragma mark- 删除 临时编辑数据
+ (void)DeleteUserDefaultsDataForKey:(NSString*)Vkey {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:Vkey];
    [userDefaults synchronize];
    
}

#pragma mark- 保存图片文件 返回沙盒 存储地址数组
+ (NSMutableArray *)saveImageArray:(NSArray*)imageArray {
    NSMutableArray *filePathArray = [[NSMutableArray alloc]init];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDir = [paths objectAtIndex:0];
    
    for (int I=0; I<imageArray.count; I++) {
        NSString* date;
        NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"YYYYMMddhhmmss"];
        date = [formatter stringFromDate:[NSDate date]];
        
        NSString*imagesName = [NSString stringWithFormat:@"ActivityImages%@%d.jpg",date,I];
        NSString *toPath = [cachesDir stringByAppendingString:[NSString stringWithFormat:@"/%@",imagesName]];
        UIImage *currentImage = imageArray[I];
        
        NSLog(@"====%@===",toPath);
        NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
        [imageData writeToFile:toPath atomically:NO];
        [filePathArray addObject:toPath];
        
    }
    return filePathArray;
}

#pragma mark- 沙盒存储地址 中 获取image图片文件
+ (NSMutableArray *)getImageArray:(NSArray*)imageUrlArray {
    NSMutableArray *imageArray = [[NSMutableArray alloc]init];
    
    for (int i=0; i<imageUrlArray.count; i++) {
        UIImage *imagedata = [self getImageFileWithName:imageUrlArray[i]];
        if (imagedata) {
            [imageArray addObject:imagedata];
        }
    }
    return imageArray;
}

#pragma mark- 本地地址 转image
+ (UIImage*)getImageFileWithName:(NSString*)filePath {
    NSError* err = [[NSError alloc] init];
    NSData* data = [[NSData alloc] initWithContentsOfFile:filePath
                    
                                                  options:NSDataReadingMapped
                    
                                                    error:&err];
    
    UIImage* img = nil;
    if(data != nil) {
        img = [[UIImage alloc] initWithData:data];
    } else {
        img = [UIImage imageNamed:@"zhanwei1"];
        NSLog(@"图片为空！");
    }
    return img;
}



+ (UIImage *)handleImage:(UIImage *)originalImage withSize:(CGSize)size {
    if (!originalImage) {
        return originalImage;
    }
    CGSize originalsize = [originalImage size];
    NSLog(@"改变前图片的宽度为%f,图片的高度为%f",originalsize.width,originalsize.height);
    if (originalsize.width < 0.0001 || originalsize.height< 0.0001 || size.width < 0.0001 || size.height < 0.0001 ) {
        
        return originalImage;
    }
    
    float origWH = originalsize.width / originalsize.height;
    float sizeWH = size.width / size.height;
    
    //原图宽高比 大于 标准宽高比
    if(origWH > sizeWH) {
        CGFloat rate = 1.0;
        CGFloat widthRate = originalsize.width/size.width;
        CGFloat heightRate = originalsize.height/size.height;
        
        rate = widthRate>heightRate?heightRate:widthRate;
        
        CGSize tempSize;
        tempSize.height = originalsize.height;
        tempSize.width = sizeWH * originalsize.height;
        size = tempSize;
        
        CGImageRef imageRef = nil;
        
        if (heightRate>widthRate) {
            imageRef = CGImageCreateWithImageInRect([originalImage CGImage], CGRectMake(0, originalsize.height/2-size.height*rate/2, originalsize.width, size.height*rate));//获取图片整体部分
        } else {
            imageRef = CGImageCreateWithImageInRect([originalImage CGImage], CGRectMake(originalsize.width/2-size.width*rate/2, 0, size.width*rate, originalsize.height));//获取图片整体部分
        }
        UIGraphicsBeginImageContext(size);//指定要绘画图片的大小
        CGContextRef con = UIGraphicsGetCurrentContext();
        
        CGContextTranslateCTM(con, 0.0, size.height);
        CGContextScaleCTM(con, 1.0, -1.0);
        
        CGContextDrawImage(con, CGRectMake(0, 0, size.width, size.height), imageRef);
        
        UIImage *standardImage = UIGraphicsGetImageFromCurrentImageContext();
        NSLog(@"改变后图片的宽度为%f,图片的高度为%f",[standardImage size].width,[standardImage size].height);
        
        UIGraphicsEndImageContext();
        CGImageRelease(imageRef);
        
        return standardImage;
        
    } else if(origWH < sizeWH) {
        CGImageRef imageRef = nil;
        
        CGSize tempSize;
        tempSize.height = originalsize.width * (size.height / size.width);
        tempSize.width = originalsize.width;
        size = tempSize;
        
        
        if(originalsize.height>size.height)
        {
            imageRef = CGImageCreateWithImageInRect([originalImage CGImage], CGRectMake(0, originalsize.height/2-size.height/2, originalsize.width, size.height));//获取图片整体部分
        }
        else if (originalsize.width>size.width)
        {
            imageRef = CGImageCreateWithImageInRect([originalImage CGImage], CGRectMake(originalsize.width/2-size.width/2, 0, size.width, originalsize.height));//获取图片整体部分
        }
        
        UIGraphicsBeginImageContext(size);//指定要绘画图片的大小
        CGContextRef con = UIGraphicsGetCurrentContext();
        
        CGContextTranslateCTM(con, 0.0, size.height);
        CGContextScaleCTM(con, 1.0, -1.0);
        
        CGContextDrawImage(con, CGRectMake(0, 0, size.width, size.height), imageRef);
        
        UIImage *standardImage = UIGraphicsGetImageFromCurrentImageContext();
        NSLog(@"改变后图片的宽度为%f,图片的高度为%f",[standardImage size].width,[standardImage size].height);
        
        UIGraphicsEndImageContext();
        CGImageRelease(imageRef);
        
        return standardImage;
    } else {//原图为标准长宽的，不做处理
        return originalImage;
    }
}

@end
