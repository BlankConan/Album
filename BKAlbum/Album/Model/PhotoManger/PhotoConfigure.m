//
//  PhotoConfigure.m
//  TalentIPad
//
//  Created by liugangyi on 2019/5/16.
//  Copyright © 2019年 Pegasus. All rights reserved.
//

#import "PhotoConfigure.h"
#import "PhotoModel.h"

@interface PhotoConfigure ()
{
    /// 选中的个数.
    NSInteger _selectedCount;
    /// 选中图片唯一ID数组.
    NSMutableArray *_photosId;
    NSMutableArray *_photos;
}

@end

@implementation PhotoConfigure

#pragma mark - =============== life circle ====================

- (instancetype)init
{
    self = [super init];
    if (self) {
        _photos = [NSMutableArray array];
        _selectedCount = 0;
        _photosId = [NSMutableArray array];
        _maxCount = 5;
    }
    return self;
}

- (instancetype)initWithPhotos:(NSArray<PhotoModel *> *)photos {
    self = [self init];
    if (self && photos.count) {
        for (PhotoModel *model in photos) {
            [self addModel:model];
        }
    }
    return self;
}

- (void)dealloc {
    _photosId = nil;
    _photos = nil;
}

#pragma mark - =============== 公共方法 ====================


- (void)removeModel:(PhotoModel *)model {
    for (PhotoModel *item in self.selectedPhotos) {
        if ([item.identyfier isEqualToString:model.identyfier]) {
            [_photos removeObject:item];
            [self removeID:model.identyfier];
            [self setSelectedCount:self.selectedPhotos.count];
            break;
        }
    }
}

- (void)addModel:(PhotoModel *)model {
    [_photos addObject:model];
    [self addID:model.identyfier];
    [self setSelectedCount:self.selectedPhotos.count];
}

- (BOOL)containsModel:(PhotoModel *)model {
    return [_photosId containsObject:model.identyfier];
}

- (void)clean {
    [_photosId removeAllObjects];
    [_photos removeAllObjects];
    _selectedCount = 0;
}


#pragma mark - =============== 辅助方法 ====================
- (void)addID:(NSString *)identy {
    [_photosId addObject:identy];
}

- (void)removeID:(NSString *)identy {
    if ([_photosId containsObject:identy]) {
        [_photosId removeObject:identy];
    }
}


#pragma mark - Set方法

- (void)setMaxCount:(NSInteger)maxCount {
    _maxCount = maxCount;
}

- (void)setSelectedCount:(NSInteger)selectedCount {
    _selectedCount = selectedCount;
    if (self.choiceCountChange) {
        self.choiceCountChange(_selectedCount);
    }
}

- (NSInteger)choiceCount {
    return _selectedCount;
}

- (NSArray<PhotoModel *> *)selectedPhotos {
    return _photos;
}


@end
