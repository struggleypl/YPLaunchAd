//
//  LanuchAdModel.m
//  YPLaunchAd
//
//  Created by ypl on 2019/3/26.
//  Copyright © 2019年 ypl. All rights reserved.
//

#import "LanuchAdModel.h"
#import <UIKit/UIKit.h>

@implementation LanuchAdModel
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        
        self.content = dict[@"content"];
        self.openUrl = dict[@"openUrl"];
        self.duration = [dict[@"duration"] integerValue];
        self.contentSize = dict[@"contentSize"];
    }
    return self;
}

- (CGFloat)width {
    return [[[self.contentSize componentsSeparatedByString:@"*"] firstObject] floatValue];
}

- (CGFloat)height {
    return [[[self.contentSize componentsSeparatedByString:@"*"] lastObject] floatValue];
}
@end
