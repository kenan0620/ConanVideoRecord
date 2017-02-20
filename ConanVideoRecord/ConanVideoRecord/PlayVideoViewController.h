//
//  PlayVideoViewController.h
//  ConanVideoRecord
//
//  Created by Conan on 2017/2/20.
//  Copyright © 2017年 Conan. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
@interface PlayVideoViewController : ViewController

@property(nonatomic,retain) NSURL * videoURL;

@property (nonatomic ,assign) CGFloat videoWidth;
@property (nonatomic ,assign) CGFloat videoHeight;
@end
