//
//  AlbumPhotoItem.h
//  TalentIPad
//
//  Created by liugangyi on 2019/5/16.
//  Copyright © 2019年 Pegasus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "PhotoModel.h"

typedef void(^AlbumCollectionViewCellAction)(PhotoModel *model);

@interface AlbumPhotoItem : UICollectionViewCell

/// 行数
@property (nonatomic, assign) NSInteger row;
/// 相片模型
@property (nonatomic, strong) PhotoModel *model;
/// 选中事件
@property (nonatomic, copy) AlbumCollectionViewCellAction selectPhotoAction;
/// 是否被选中
@property (nonatomic, assign) BOOL isSelect;

#pragma mark - 加载图片
-(void)loadImage:(NSIndexPath *)indexPath;

@end
