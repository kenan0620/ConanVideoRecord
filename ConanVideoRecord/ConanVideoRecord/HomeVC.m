//
//  HomeVC.m
//  ConanVideoRecord
//
//  Created by Conan on 2017/2/20.
//  Copyright © 2017年 Conan. All rights reserved.
//

#import "HomeVC.h"
#import "UIView+ConanViewLayer.h"
#import "ConanAccessRight.h"
#import "ConanVideoRecordVC.h"
@interface HomeVC ()
@property (nonatomic ,strong) UIButton *conanVideoRecordBtn;
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor brownColor];

    self.title = @"HomeVC";
    self.conanVideoRecordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.conanVideoRecordBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2-50, [UIScreen mainScreen].bounds.size.height/2-50, 100, 100);
    [self.conanVideoRecordBtn setTitle:@"视频录制" forState:UIControlStateNormal];
    [self.conanVideoRecordBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.conanVideoRecordBtn addTarget:self action:@selector(videoRecordEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.conanVideoRecordBtn ConanMakeCornerRadius:10 BorderColor:nil BorderWidth:0 BackgroundColor:[UIColor yellowColor]];
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
    
    ConanVideoRecordVC *conanVideoRecordVC = [[ConanVideoRecordVC alloc]init];
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:conanVideoRecordVC];
    [self.navigationController pushViewController:conanVideoRecordVC animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
