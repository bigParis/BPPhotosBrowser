//
//  BPPhotoLayout.m
//  BPPhotosBrowser
//
//  Created by yy on 16/3/17.
//  Copyright © 2016年 BP. All rights reserved.
//

#import "BPPhotoLayout.h"

@implementation BPPhotoLayout

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (void)prepareLayout {
    [super prepareLayout];
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    CGFloat leftRightMargin = (self.collectionView.frame.size.width - self.itemSize.width) * 0.5;
    self.sectionInset = UIEdgeInsetsMake(0, leftRightMargin, 0, leftRightMargin);
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width *0.5;
    for (UICollectionViewLayoutAttributes *attr in attributes) {
        CGFloat delta = ABS(attr.center.x - centerX);
        CGFloat scale = 1.2 - delta/self.collectionView.frame.size.width;
        attr.center = CGPointMake(attr.center.x, [UIScreen mainScreen].bounds.size.height * 0.5 -32);
        attr.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
    return attributes;
}
@end
