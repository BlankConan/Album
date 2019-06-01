//
//  PhotosManager.m
//  TalentIPad
//
//  Created by liugangyi on 2019/5/16.
//  Copyright © 2019年 Pegasus. All rights reserved.
//

#import "PhotosManager.h"
#import "AlbumViewController.h"
#import "PhotoConfigure.h"

@interface PhotosManager ()
/// configure.
@property (nonatomic, strong) PhotoConfigure *configure;

@end

static PhotosManager *manager;

@implementation PhotosManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _configure = [PhotoConfigure new];
    }
    return self;
}

- (instancetype)initWithConfigure:(PhotoConfigure *)configure {
    self = [self init];
    if (self) {
        if (_configure) {
            _configure = configure;
        }
    }
    return self;
}

+ (instancetype)showPhotosWithRootVC:(UIViewController *)viewController
                   configure:(PhotoConfigure *)configure
                  compeleted:(void (^)(NSArray<PhotoModel *> *))compeletedHandler {
    
    manager = [[PhotosManager alloc] initWithConfigure:configure];
    AlbumViewController *controller = [[AlbumViewController alloc] init];
    controller.confirmAction = ^{
        compeletedHandler(manager.configure.selectedPhotos);
    };
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    [viewController presentViewController:navigationController animated:YES completion:nil];
    return manager;
}

+ (PhotoConfigure *)configure {
    return manager.configure;
}

@end
