//
//  ViewController.m
//  BPPhotosBrowser
//
//  Created by yy on 16/3/17.
//  Copyright © 2016年 bp. All rights reserved.
//

#import "ViewController.h"
#import "BPPhotoLayout.h"
#import "BPPhotoBrowserCell.h"

static NSString *kBPPhotoCellIdentifier = @"kBPPhotoCellIdentifier";

@interface ViewController ()<UICollectionViewDataSource>

@property (nonatomic, weak) UICollectionView *photosCollectionView;
@property (nonatomic, copy) NSArray *imagesPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BPPhotoLayout *layout = [[BPPhotoLayout alloc] init];
    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 0.6, [UIScreen mainScreen].bounds.size.height * 0.6);
    
    UICollectionView *photosCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    photosCollectionView.dataSource = self;
    photosCollectionView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:photosCollectionView];
    [photosCollectionView registerClass:[BPPhotoBrowserCell class] forCellWithReuseIdentifier:kBPPhotoCellIdentifier];
    
    self.photosCollectionView = photosCollectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imagesPath.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BPPhotoBrowserCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kBPPhotoCellIdentifier forIndexPath:indexPath];
    cell.imagePath = self.imagesPath[indexPath.row];
    return cell;
}

- (NSArray *)imagesPath {
    if (_imagesPath == nil) {
        NSMutableArray *tmpArray = [NSMutableArray array];
        for (int i = 0 ; i < 10; ++i) {
            NSString *imagePath = [NSString stringWithFormat:@"女玩家_%02d", i];
            [tmpArray addObject:imagePath];
        }
        _imagesPath = [NSArray arrayWithArray:tmpArray];
    }
    return _imagesPath;
}
@end
