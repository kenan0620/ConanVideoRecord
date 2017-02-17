//
//  ConanAccessRight.m
//  ConanVideoRecord
//
//  Created by Conan on 2017/2/16.
//  Copyright © 2017年 Conan. All rights reserved.
//

#import "ConanAccessRight.h"

@implementation ConanAccessRight

+ (ConanAccessRight *)sharedInstance
{
    static ConanAccessRight *accessRightShareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        accessRightShareInstance = [[ConanAccessRight alloc]init];
    });
    return  accessRightShareInstance;
}

/*
 *麦克风权限
 */
-(void)ConanAccessRightMicrophone:(void (^)(BOOL Authorize))result
{
    AVAudioSessionRecordPermission micPermisson = [[AVAudioSession sharedInstance] recordPermission];
    
    if (micPermisson == AVAudioSessionRecordPermissionUndetermined) {
        [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
            result(granted);
        }];
    } else if (micPermisson == AVAudioSessionRecordPermissionGranted) {
        result(YES);
    } else {
        result(NO);
    }
}

/*
 *相机权限
 *
 *
 AVAuthorizationStatusNotDetermined = 0,用户尚未做出选择这个应用程序的问候
	AVAuthorizationStatusRestricted,此应用程序没有被授权访问的照片数据。可能是家长控制权限
	AVAuthorizationStatusDenied,用户已经明确否认了这一照片数据的应用程序访问
	AVAuthorizationStatusAuthorized用户已经授权应用访问照片数据
 
 */
-(void)ConanAccessRightCamera:(void (^)(BOOL Authorize))result
{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    if(authStatus == AVAuthorizationStatusNotDetermined){
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            result(granted);
        }];
    } else if (authStatus == AVAuthorizationStatusAuthorized) {
        result(YES);
    } else {
        result(NO);
    }
}
@end
