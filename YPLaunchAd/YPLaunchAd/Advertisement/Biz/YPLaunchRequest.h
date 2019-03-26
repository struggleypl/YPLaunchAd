//
//  YPLaunchRequest.h
//  YPLaunchAd
//
//  Created by ypl on 2019/3/26.
//  Copyright © 2019年 ypl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^HttpRequestSucess) (NSDictionary * response);
typedef void(^HttpRequestFailure) (NSError *error);

@interface YPLaunchRequest : NSObject

/**
 *  此处用于模拟广告数据请求,实际项目中请做真实请求
 */
+ (void)getLaunchAdImageDataSuccess:(HttpRequestSucess)success failure:(HttpRequestFailure)failure;
+ (void)getLaunchAdVideoDataSuccess:(HttpRequestSucess)success failure:(HttpRequestFailure)failure;

@end

NS_ASSUME_NONNULL_END
