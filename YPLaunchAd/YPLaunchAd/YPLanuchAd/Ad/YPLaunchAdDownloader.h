//
//  YPLaunchAdDownloaderManager.h
//  YPLaunchAdExample
//
//  Created by ypl on 2019/3/26.
//  Copyright © 2019年 ypl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - YPLaunchAdDownload

typedef void(^YPLaunchAdDownloadProgressBlock)(unsigned long long total, unsigned long long current);

typedef void(^YPLaunchAdDownloadImageCompletedBlock)(UIImage *_Nullable image, NSData * _Nullable data, NSError * _Nullable error);

typedef void(^YPLaunchAdDownloadVideoCompletedBlock)(NSURL * _Nullable location, NSError * _Nullable error);

typedef void(^YPLaunchAdBatchDownLoadAndCacheCompletedBlock) (NSArray * _Nonnull completedArray);

@protocol YPLaunchAdDownloadDelegate <NSObject>

- (void)downloadFinishWithURL:(nonnull NSURL *)url;

@end

@interface YPLaunchAdDownload : NSObject
@property (assign, nonatomic ,nonnull)id<YPLaunchAdDownloadDelegate> delegate;
@end

@interface YPLaunchAdImageDownload : YPLaunchAdDownload

@end

@interface YPLaunchAdVideoDownload : YPLaunchAdDownload

@end

#pragma mark - YPLaunchAdDownloader
@interface YPLaunchAdDownloader : NSObject

+(nonnull instancetype )sharedDownloader;

- (void)downloadImageWithURL:(nonnull NSURL *)url progress:(nullable YPLaunchAdDownloadProgressBlock)progressBlock completed:(nullable YPLaunchAdDownloadImageCompletedBlock)completedBlock;

- (void)downLoadImageAndCacheWithURLArray:(nonnull NSArray <NSURL *> * )urlArray;
- (void)downLoadImageAndCacheWithURLArray:(nonnull NSArray <NSURL *> * )urlArray completed:(nullable YPLaunchAdBatchDownLoadAndCacheCompletedBlock)completedBlock;

- (void)downloadVideoWithURL:(nonnull NSURL *)url progress:(nullable YPLaunchAdDownloadProgressBlock)progressBlock completed:(nullable YPLaunchAdDownloadVideoCompletedBlock)completedBlock;

- (void)downLoadVideoAndCacheWithURLArray:(nonnull NSArray <NSURL *> * )urlArray;
- (void)downLoadVideoAndCacheWithURLArray:(nonnull NSArray <NSURL *> * )urlArray completed:(nullable YPLaunchAdBatchDownLoadAndCacheCompletedBlock)completedBlock;

@end

