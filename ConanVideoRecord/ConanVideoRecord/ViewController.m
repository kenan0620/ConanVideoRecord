//
//  ViewController.m
//  ConanVideoRecord
//
//  Created by Conan on 2017/2/14.
//  Copyright © 2017年 Conan. All rights reserved.
//

#import "ViewController.h"

#import "ConanAccessRight.h"


@interface ViewController ()<UINavigationControllerDelegate,UIAlertViewDelegate>
@property (nonatomic ,strong) UIButton *conanVideoRecordBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];

    self.conanVideoRecordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.conanVideoRecordBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2-50, [UIScreen mainScreen].bounds.size.height/2-50, 100, 100);
    self.conanVideoRecordBtn.backgroundColor = [UIColor yellowColor];
    [self.conanVideoRecordBtn setTitle:@"视频录制" forState:UIControlStateNormal];
    [self.conanVideoRecordBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.conanVideoRecordBtn.layer.cornerRadius = 10;
    self.conanVideoRecordBtn.layer.masksToBounds = YES;
    [self.conanVideoRecordBtn addTarget:self action:@selector(videoRecordEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.conanVideoRecordBtn];
    
}

#pragma mark 视频录制点击事件
-(void)videoRecordEvent
{
    [[ConanAccessRight sharedInstance] ConanAccessRightCamera:^(BOOL Authorize) {
        if (Authorize) {
            NSLog(@"ConanAccessRightCamera开启");
                   } else {
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"相机权限未开启" message:@"ConanAccessRightCamera权限未开启" preferredStyle:UIAlertControllerStyleAlert];
            
            [self presentViewController:alertVC animated:YES completion:nil];
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
            }];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                
            }];
            
            [alertVC addAction:okAction];
            [alertVC addAction:cancelAction];
                       return ;
        }
    }];
    
    [[ConanAccessRight sharedInstance] ConanAccessRightMicrophone:^(BOOL Authorize) {
        if (Authorize) {
            NSLog(@"ConanAccessRightMicrophone开启");
        } else {
            NSLog(@"ConanAccessRightMicrophone未开启");
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"相机权限未开启" message:@"ConanAccessRightMicrophone权限未开启" preferredStyle:UIAlertControllerStyleAlert];
            
            [self presentViewController:alertVC animated:YES completion:nil];
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
            }];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                
            }];
            
            [alertVC addAction:okAction];
            [alertVC addAction:cancelAction];
            return ;
        }
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
