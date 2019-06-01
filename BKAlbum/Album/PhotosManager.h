//
//  PhotosManager.h
//  TalentIPad
//
//  Created by liugangyi on 2019/5/16.
//  Copyright © 2019年 Pegasus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoConfigure.h"

@interface PhotosManager : NSObject


/**
 显示相册

 @param viewController 当前的控制器
 @param configure 配置
 @param compeletedHandler 完成掉
 @return 返回单例
 */
+ (instancetype)showPhotosWithRootVC:(UIViewController *)viewController
                           configure:(PhotoConfigure *)configure
                          compeleted:(void(^)(NSArray<PhotoModel *> *albumArray))compeletedHandler;


+ (PhotoConfigure *)configure;

@end
