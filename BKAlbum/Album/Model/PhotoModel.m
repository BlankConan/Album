//
//  PhotoModel.m
//  TalentIPad
//
//  Created by liugangyi on 2019/5/16.
//  Copyright © 2019年 Pegasus. All rights reserved.
//

#import "PhotoModel.h"

@interface PhotoModel ()
/// 获取图片的id.
@property (nonatomic, assign) PHImageRequestID requestID;
@end

@implementation PhotoModel

- (void)setAsset:(PHAsset *)asset {
    _asset = asset;
}

- (void)loadImage {
    
    if (!_asset) return;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
        // 同步获得图片, 只会返回1张图片
        options.synchronous = YES;
        options.deliveryMode = PHImageRequestOptionsDeliveryModeOpportunistic;
        options.resizeMode = PHImageRequestOptionsResizeModeFast;
        
        /// 当选择后获取原图
        self.requestID = [[PHCachingImageManager defaultManager] requestImageForAsset:self.asset targetSize:PHImageManagerMaximumSize contentMode:PHImageContentModeDefault options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            self.highDefinitionImage = result;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (self.getPictureAction) {
                    self.getPictureAction();
                }
            });
        }];
    });
}

- (void)cancelLoad {
    if (_requestID == 0) return;
    [[PHCachingImageManager defaultManager] cancelImageRequest:self.requestID];
}

- (NSString *)identyfier {
    return _asset ? _asset.localIdentifier:@"";
}

@end
