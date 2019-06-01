//
//  PhotoModel.h
//  TalentIPad
//
//  Created by liugangyi on 2019/5/16.
//  Copyright © 2019年 Pegasus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

typedef void(^PhotoModelAction)(void);

// 单个视频或者图片模型
@interface PhotoModel : NSObject

/// 相片
@property (nonatomic, strong) PHAsset *asset;
/// 高清图
@property (nonatomic, strong) UIImage *highDefinitionImage;
/// 获取图片成功事件
@property (nonatomic, copy) PhotoModelAction getPictureAction;
/// 是否被选中.
@property (nonatomic, assign) BOOL isSelected;
/// 序号.
@property (nonatomic, assign) NSInteger serialNum;
/// ID.
@property (nonatomic, strong, readonly) NSString *identyfier;

- (void)loadImage;

@end
