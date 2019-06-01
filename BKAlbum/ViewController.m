//
//  ViewController.m
//  BKAlbum
//
//  Created by liugangyi on 2019/5/28.
//  Copyright © 2019年 liuigangi. All rights reserved.
//

#import "ViewController.h"
#import "PhotosManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    PhotoConfigure *configure = [[PhotoConfigure alloc] init];
    [PhotosManager showPhotosWithRootVC:self configure:configure compeleted:^(NSArray<PhotoModel *> *albumArray) {
        NSLog(@"%@",albumArray);
    }];
}

@end
