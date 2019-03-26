//
//  YPLaunchAdController.m
//  YPLaunchAdExample
//
//  Created by ypl on 2019/3/26.
//  Copyright © 2019年 ypl. All rights reserved.
//

#import "YPLaunchAdController.h"
#import "YPLaunchAdConst.h"

@interface YPLaunchAdController ()

@end

@implementation YPLaunchAdController

-(BOOL)shouldAutorotate{
    
    return NO;
}

-(BOOL)prefersHomeIndicatorAutoHidden{
    
    return YPLaunchAdPrefersHomeIndicatorAutoHidden;
}

@end
