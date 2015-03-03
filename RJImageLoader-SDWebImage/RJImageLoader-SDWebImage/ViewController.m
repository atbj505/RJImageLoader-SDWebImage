//
//  ViewController.m
//  RJImageLoader-SDWebImage
//
//  Created by Robert on 15/3/3.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "UIImageView+RJLoader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100, 320, 200)];
    [self.view addSubview:imageView];
    
    [imageView startLoaderWithTintColor:[UIColor blueColor]];

    [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://www.hdwallpapersinn.com/wp-content/uploads/2014/08/cute-cat-wallpapers.jpg"] placeholderImage:nil options:SDWebImageCacheMemoryOnly | SDWebImageRefreshCached progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        [imageView updateImageDownloadProgress:(CGFloat)receivedSize/expectedSize];
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [imageView reveal];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
