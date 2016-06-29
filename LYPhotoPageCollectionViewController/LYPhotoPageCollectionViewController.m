//
//  LYPhotoPageCollectionViewController.m
//  LYPhotoPageCollectionViewControllerDemo
//
//  Created by Jin Lingyun on 15-3-4.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import "LYPhotoPageCollectionViewController.h"
#import "LYPhotoView.h"
#import "LYPhotoCollectionViewCell.h"

@interface LYPhotoPageCollectionViewController ()

@property (nonatomic, strong) UICollectionViewFlowLayout *collectionViewFlowLayout;

@end

@implementation LYPhotoPageCollectionViewController

static NSString * const kPhotoCollectionViewCellIdentifier = @"PhotoCollectionViewCellIdentifier";
static const CGFloat kPhotoMargin = 20;

- (void)viewDidLoad
{
    [super viewDidLoad];

    CGRect frame1 = self.view.frame;
    UICollectionViewFlowLayout *collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionViewFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    collectionViewFlowLayout.minimumInteritemSpacing = kPhotoMargin * 2;
    collectionViewFlowLayout.minimumLineSpacing = kPhotoMargin * 2;
    collectionViewFlowLayout.itemSize = self.view.frame.size;
    collectionViewFlowLayout.sectionInset = UIEdgeInsetsMake(0, kPhotoMargin, 0, kPhotoMargin);
    self.collectionViewFlowLayout = collectionViewFlowLayout;

    CGRect frame = CGRectMake(-kPhotoMargin, 0, self.view.frame.size.width + kPhotoMargin * 2, self.view.frame.size.height);
    self.collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:collectionViewFlowLayout];
//    self.collectionView.backgroundColor = [UIColor yellowColor];
//    self.collectionView.delegate = self;
//    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.collectionView];
//    [self.collectionView registerClass:LYPhotoCollectionViewCell.class forCellWithReuseIdentifier:kPhotoCollectionViewCellIdentifier];
    

//    [self.collectionView setCollectionViewLayout:collectionViewFlowLayout animated:NO];
}

//- (void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//    
//    // we get correct frame of self.view at this point.
//    self.collectionView.frame = CGRectMake(-kPhotoMargin, 0, self.view.frame.size.width + kPhotoMargin * 2, self.view.frame.size.height);
//    self.collectionViewFlowLayout.itemSize = self.view.frame.size;
//}

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    return 1;
//}
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//    return 10;
//}

//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    LYPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kPhotoCollectionViewCellIdentifier forIndexPath:indexPath];
////    [cell configCollectionViewCellWithMessage:[self.messages objectAtIndex:indexPath.row]];
//    return cell;
//}

@end
