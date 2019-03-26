//
//  YPLaunchRequest.m
//  YPLaunchAd
//
//  Created by ypl on 2019/3/26.
//  Copyright © 2019年 ypl. All rights reserved.
//

#import "YPLaunchRequest.h"

@implementation YPLaunchRequest

/**
 *  此处模拟广告数据请求,实际项目中请做真实请求
 */
+ (void)getLaunchAdImageDataSuccess:(HttpRequestSucess)success failure:(HttpRequestFailure)failure {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSData *JSONData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"LaunchImageAd" ofType:@"json"]];
        if (JSONData == nil) {
            return ;
        }
        NSDictionary *json =  [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];
        if(success) success(json);
        
    });
}

/**
 *  此处模拟广告数据请求,实际项目中请做真实请求
 */
+ (void)getLaunchAdVideoDataSuccess:(HttpRequestSucess)success failure:(HttpRequestFailure)failure {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSData *JSONData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"LaunchVideoAd" ofType:@"json"]];
        if (JSONData == nil) {
            return ;
        }
        NSDictionary *json =  [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];
        if(success) success(json);
        
    });
}
@end
