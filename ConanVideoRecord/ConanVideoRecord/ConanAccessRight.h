//
//  ConanAccessRight.h
//  ConanVideoRecord
//
//  Created by Conan on 2017/2/16.
//  Copyright © 2017年 Conan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface ConanAccessRight : NSObject

+ (ConanAccessRight *)sharedInstance;
/*
 *麦克风权限
 */
-(void)ConanAccessRightMicrophone:(void (^)(BOOL Authorize))result;

/*
 *相机权限
 *
 *
 AVAuthorizationStatusNotDetermined = 0,用户尚未做出选择这个应用程序的问候
	AVAuthorizationStatusRestricted,此应用程序没有被授权访问的照片数据。可能是家长控制权限
	AVAuthorizationStatusDenied,用户已经明确否认了这一照片数据的应用程序访问
	AVAuthorizationStatusAuthorized用户已经授权应用访问照片数据
 
 */
-(void)ConanAccessRightCamera:(void (^)(BOOL Authorize))result;
@end
