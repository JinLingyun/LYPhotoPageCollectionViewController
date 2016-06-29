//
//  LYPhotoGalleryViewController.m
//  LYPhotoPageViewControllerDemo
//
//  Created by Jin Lingyun on 15-3-3.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import "LYPhotoGalleryViewController.h"
#import "LYPhotoPageCollectionViewController.h"
#import "LYPhotoCollectionViewCell.h"
#import "LYPhotoItem.h"

@interface LYPhotoGalleryViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UIActionSheetDelegate, LYPhotoCollectionViewCellDelegate>

@property (nonatomic, strong) LYPhotoPageCollectionViewController *pageViewController;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation LYPhotoGalleryViewController

static NSString * const kPhotoCollectionViewCellIdentifier = @"PhotoCollectionViewCellIdentifier";

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIImage *image = [self.backButton imageForState:UIControlStateNormal];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.backButton setImage:image forState:UIControlStateNormal];
    self.backButton.tintColor = [UIColor whiteColor];

    CGRect bound = self.view.bounds;
    self.pageViewController = [[LYPhotoPageCollectionViewController alloc] init];
    self.pageViewController.view.frame = self.view.bounds;
    [self.view insertSubview:self.pageViewController.view atIndex:0];
    [self addChildViewController:self.pageViewController];
    self.pageViewController.collectionView.delegate = self;
    self.pageViewController.collectionView.dataSource = self;
    [self.pageViewController.collectionView registerClass:LYPhotoCollectionViewCell.class forCellWithReuseIdentifier:kPhotoCollectionViewCellIdentifier];
    [self.pageViewController.collectionView reloadData];
    [self loadPageViewControllerData];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)loadPageViewControllerData
{
    self.indexLabel.text = [NSString stringWithFormat:@"%@/%@",@(self.currentIndex + 1).stringValue,@(self.photoList.count).stringValue];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.currentIndex inSection:0];
//    [self.pageViewController.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}

- (IBAction)handleTapGesture
{
    self.topView.hidden = !self.topView.hidden;
}

- (IBAction)didTappedDeleteButton:(UIButton *)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:@"删除照片"
                                                    otherButtonTitles:nil, nil];
    [actionSheet showInView:self.view];
}

- (IBAction)didTappedBackButton:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
//{
//    if (buttonIndex == 0) {
//        NSMutableArray *photoList = [NSMutableArray arrayWithArray:self.photoList];
//        [photoList removeObjectAtIndex:self.currentIndex];
//        if (!photoList.count) {
//            [self dismissViewControllerAnimated:YES completion:nil];
//        } else {
//            self.photoList = photoList;
//            [self.pageViewController deletePhotoViewControllerAtIndex:self.currentIndex scrollAnimation:EPhotoPageScrollAnimationDirectionAutomic completion:^(BOOL finished) {
//                self.currentIndex = self.pageViewController.currentIndex;
//                self.indexLabel.text = [NSString stringWithFormat:@"%@/%@",@(self.currentIndex + 1).stringValue,@(self.photoList.count).stringValue];
//            }];
//        }
//    }
//}

#pragma mark -

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photoList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    int row = indexPath.item;
    LYPhotoItem *photoItem = self.photoList[indexPath.item];
    LYPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kPhotoCollectionViewCellIdentifier forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor yellowColor];
    cell.delegate = self;
    [cell configWithPhotoUrl:photoItem.largeURL placeholderImage:nil];
    return cell;
}

#pragma mark-RMPhotoPageViewControllerDelegate

//- (void)photoPageViewController:(LYPhotoPageViewController *)photoPageViewController didScorllToIndex:(NSUInteger)index
//{
//    self.indexLabel.text = [NSString stringWithFormat:@"%@/%@",@(index + 1).stringValue,@(self.photoList.count).stringValue];
//    self.currentIndex = index;
//}

- (CGFloat)zoomScaleForImageSize:(CGSize)size
{
    return self.view.frame.size.width / size.width;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

@end
