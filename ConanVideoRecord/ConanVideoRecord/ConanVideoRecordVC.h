//
//  ConanVideoRecordVC.h
//  ConanVideoRecord
//
//  Created by Conan on 2017/2/20.
//  Copyright © 2017年 Conan. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import "UIView+ConanViewLayer.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ConanVideoRecordVC : ViewController
@property float totalTime; //视频总长度 默认10秒
@end
