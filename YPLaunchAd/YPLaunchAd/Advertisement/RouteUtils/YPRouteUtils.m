//
//  YPRouteUtils.m
//  YPLaunchAd
//
//  Created by ypl on 2019/3/26.
//  Copyright © 2019年 ypl. All rights reserved.
//

#import "YPRouteUtils.h"

@implementation YPRouteUtils
+ (UIViewController *)currentViewController {
    UIViewController * rootvc = UIApplication.sharedApplication.keyWindow.rootViewController;
    do {
        if ([rootvc isKindOfClass:UINavigationController.class]) {
            UINavigationController * nav = (UINavigationController *)rootvc;
            rootvc = nav.visibleViewController;
        }
        else if([rootvc isKindOfClass:UITabBarController.class]){
            UITabBarController * tabVC = (UITabBarController *)rootvc;
            rootvc = [tabVC.viewControllers objectAtIndex:tabVC.selectedIndex];
        }
        else if ([rootvc isKindOfClass:UIViewController.class]){
            return rootvc;
        }
    } while (1);
}
@end
