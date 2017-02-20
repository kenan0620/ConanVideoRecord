//
//  UIView+ConanViewLayer.m
//  ConanVideoRecord
//
//  Created by Conan on 2017/2/17.
//  Copyright © 2017年 Conan. All rights reserved.
//

#import "UIView+ConanViewLayer.h"

@implementation UIView (ConanViewLayer)

-(void)ConanMakeCornerRadius:(float)CornerRadius BorderColor:(UIColor*)borderColor BorderWidth:(float)borderWidth BackgroundColor:(UIColor *)bgColor
{
    self.backgroundColor = bgColor;
    
    self.layer.cornerRadius = CornerRadius;
    
    self.layer.borderWidth = borderWidth;
    
    if (borderColor != nil) {
        self.layer.borderColor = borderColor.CGColor;
    }
    
    if (bgColor != nil) {
        self.layer.borderColor = borderColor.CGColor;
    }
    
    self.layer.masksToBounds = YES;
}

@end
