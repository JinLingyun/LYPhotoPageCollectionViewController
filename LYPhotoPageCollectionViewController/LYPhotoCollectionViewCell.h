//
//  LYPhotoCollectionViewCell.h
//  LYPhotoPageCollectionViewControllerDemo
//
//  Created by Jin Lingyun on 15-3-4.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LYPhotoCollectionViewCellDelegate <NSObject>

@optional
- (CGFloat)zoomScaleForImageSize:(CGSize)size;

@end

@interface LYPhotoCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) id<LYPhotoCollectionViewCellDelegate> delegate;

- (void)configWithPhotoUrl:(NSURL *)photoUrl placeholderImage:(UIImage *)placeholderImage;

@end
