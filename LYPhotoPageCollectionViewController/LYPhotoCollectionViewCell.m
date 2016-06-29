//
//  LYPhotoCollectionViewCell.m
//  LYPhotoPageCollectionViewControllerDemo
//
//  Created by Jin Lingyun on 15-3-4.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import "LYPhotoCollectionViewCell.h"
#import "LYPhotoView.h"
#import "UIImageView+WebCache.h"

@interface LYPhotoCollectionViewCell ()

@property (nonatomic, strong) LYPhotoView *photoView;

@end

@implementation LYPhotoCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.photoView = [[LYPhotoView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self.contentView addSubview:self.photoView];
    }
    return self;
}

- (void)prepareForReuse
{
    self.photoView.imageView.image = nil;
}

- (void)configWithPhotoUrl:(NSURL *)photoUrl placeholderImage:(UIImage *)placeholderImage
{
    __weak typeof(self) weakSelf = self;
    [self.photoView.imageView sd_setImageWithURL:photoUrl placeholderImage:placeholderImage options:SDWebImageRetryFailed completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        CGFloat zoomScale = 1.0;
        if (image && [weakSelf.delegate respondsToSelector:@selector(zoomScaleForImageSize:)]) {
            zoomScale = [weakSelf.delegate zoomScaleForImageSize:image.size];
        }
        [weakSelf.photoView setPhoto:image withScale:zoomScale];
    }];
}

@end
