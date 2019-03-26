//
//  YPLaunchImageView.h
//  YPLaunchAdExample
//
//  Created by ypl on 2019/3/26.
//  Copyright © 2019年 ypl. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 启动图来源 */
typedef NS_ENUM(NSInteger,SourceType) {
    /** LaunchImage(default) */
    SourceTypeLaunchImage = 1,
    /** LaunchScreen.storyboard */
    SourceTypeLaunchScreen = 2,
};

typedef NS_ENUM(NSInteger,LaunchImagesSource){
    LaunchImagesSourceLaunchImage = 1,
    LaunchImagesSourceLaunchScreen = 2,
};

@interface YPLaunchImageView : UIImageView

- (instancetype)initWithSourceType:(SourceType)sourceType;

@end
