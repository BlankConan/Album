//
//  AlbumModel.m
//  TalentIPad
//
//  Created by liugangyi on 2019/5/16.
//  Copyright © 2019年 Pegasus. All rights reserved.
//

#import "AlbumModel.h"

@implementation AlbumModel

- (void)setCollection:(PHAssetCollection *)collection {    
    _collection = collection;
    
    if ([collection.localizedTitle isEqualToString:@"All Photos"]) {
        self.collectionTitle = @"全部相册";
    } else {
        self.collectionTitle = collection.localizedTitle;
    }
    
    self.collectionTitle = collection.localizedTitle;
    
    // 获得某个相簿中的所有PHAsset对象
    PHFetchResult<PHAsset *> *result  = [PHAsset fetchAssetsInAssetCollection:collection options:nil];
    if (result.count > 0) {
        self.firstAsset = result.firstObject;
    }
    
    NSMutableArray *arr = [NSMutableArray array];
    for (PHAsset *asset in result) {
        PhotoModel *model = [PhotoModel new];
        model.asset = asset;
        [arr addObject:model];
    }
    self.collectionNumber = [NSString stringWithFormat:@"%ld", arr.count];
    self.assets = [NSArray arrayWithArray:arr];
}

@end
