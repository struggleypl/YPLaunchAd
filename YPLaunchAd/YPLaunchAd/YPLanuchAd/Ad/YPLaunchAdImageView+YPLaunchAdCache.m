//
//  YPLaunchAdImageView+YPLaunchAdCache.m
//  YPLaunchAdExample
//
//  Created by ypl on 2019/3/26.
//  Copyright © 2019年 ypl. All rights reserved.
//

#import "YPLaunchAdImageView+YPLaunchAdCache.h"
#import "FLAnimatedImage.h"
#import "YPLaunchAdConst.h"

@implementation YPLaunchAdImageView (YPLaunchAdCache)
- (void)xh_setImageWithURL:(nonnull NSURL *)url{
    [self xh_setImageWithURL:url placeholderImage:nil];
}

- (void)xh_setImageWithURL:(nonnull NSURL *)url placeholderImage:(nullable UIImage *)placeholder{
    [self xh_setImageWithURL:url placeholderImage:placeholder options:YPLaunchAdImageDefault];
}

-(void)xh_setImageWithURL:(nonnull NSURL *)url placeholderImage:(nullable UIImage *)placeholder options:(YPLaunchAdImageOptions)options{
    [self xh_setImageWithURL:url placeholderImage:placeholder options:options completed:nil];
}

- (void)xh_setImageWithURL:(nonnull NSURL *)url completed:(nullable XHExternalCompletionBlock)completedBlock {
    
    [self xh_setImageWithURL:url placeholderImage:nil completed:completedBlock];
}

- (void)xh_setImageWithURL:(nonnull NSURL *)url placeholderImage:(nullable UIImage *)placeholder completed:(nullable XHExternalCompletionBlock)completedBlock{
    [self xh_setImageWithURL:url placeholderImage:placeholder options:YPLaunchAdImageDefault completed:completedBlock];
}

-(void)xh_setImageWithURL:(nonnull NSURL *)url placeholderImage:(nullable UIImage *)placeholder options:(YPLaunchAdImageOptions)options completed:(nullable XHExternalCompletionBlock)completedBlock{
    [self xh_setImageWithURL:url placeholderImage:placeholder GIFImageCycleOnce:NO options:options GIFImageCycleOnceFinish:nil completed:completedBlock ];
}

- (void)xh_setImageWithURL:(nonnull NSURL *)url placeholderImage:(nullable UIImage *)placeholder GIFImageCycleOnce:(BOOL)GIFImageCycleOnce options:(YPLaunchAdImageOptions)options GIFImageCycleOnceFinish:(void(^_Nullable)(void))cycleOnceFinishBlock completed:(nullable XHExternalCompletionBlock)completedBlock {
    if(placeholder) self.image = placeholder;
    if(!url) return;
    XHWeakSelf
    [[YPLaunchAdImageManager sharedManager] loadImageWithURL:url options:options progress:nil completed:^(UIImage * _Nullable image,  NSData *_Nullable imageData, NSError * _Nullable error, NSURL * _Nullable imageURL) {
        if(!error){
            if(XHISGIFTypeWithData(imageData)){
                weakSelf.image = nil;
                weakSelf.animatedImage = [FLAnimatedImage animatedImageWithGIFData:imageData];
                weakSelf.loopCompletionBlock = ^(NSUInteger loopCountRemaining) {
                    if(GIFImageCycleOnce){
                       [weakSelf stopAnimating];
                        YPLaunchAdLog(@"GIF不循环,播放完成");
                        if(cycleOnceFinishBlock) cycleOnceFinishBlock();
                    }
                };
            }else{
                weakSelf.image = image;
                weakSelf.animatedImage = nil;
            }
        }
        if(completedBlock) completedBlock(image,imageData,error,imageURL);
    }];
}

@end
