//
//  PhotoConfigure.h
//  TalentIPad
//
//  Created by liugangyi on 2019/5/16.
//  Copyright © 2019年 Pegasus. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PhotoModel;

typedef void(^ChoiceCountChangeHandler)(NSInteger choiceCount);

@interface PhotoConfigure : NSObject

- (instancetype)init;

/**
 指定选中的图片初始化

 @param photos 选中的模型数据
 @return 返回实例
 */
- (instancetype)initWithPhotos:(NSArray <PhotoModel *>*)photos;

/// 可选的的最大数量
@property (nonatomic, assign) NSInteger maxCount;
/// 已选数量
@property (nonatomic, assign, readonly) NSInteger choiceCount;
/// 已选图片
@property (nonatomic, copy, readonly) NSArray<PhotoModel *> *selectedPhotos;
/// 选择图片变化
@property (nonatomic, copy) ChoiceCountChangeHandler choiceCountChange;

- (void)removeModel:(PhotoModel *)model;

- (BOOL)containsModel:(PhotoModel *)model;

- (void)addModel:(PhotoModel *)model;

- (void)clean;

@end
