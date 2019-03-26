//
//  YPWebViewController.h
//  YPLaunchAd
//
//  Created by ypl on 2019/3/26.
//  Copyright © 2019年 ypl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YPWebViewController : UIViewController

@property (nonatomic , copy) NSString *URLString;

@property( nonatomic , strong ) WKWebView * webView;

@property( nonatomic , strong ) UIProgressView * progressView;

@end

NS_ASSUME_NONNULL_END
