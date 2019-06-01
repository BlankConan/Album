//
//  AlbumViewController.h
//  TalentIPad
//
//  Created by liugangyi on 2019/5/16.
//  Copyright © 2019年 Pegasus. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AlbumViewControllerConfirmAction)(void);

@interface AlbumViewController : UIViewController

/// 确定事件
@property (nonatomic, copy) AlbumViewControllerConfirmAction confirmAction;

@end
