//
//  BPPhotoBrowserCell.m
//  BPPhotosBrowser
//
//  Created by yy on 16/3/17.
//  Copyright © 2016年 BP. All rights reserved.
//

#import "BPPhotoBrowserCell.h"

@interface BPPhotoBrowserCell ()

@property (nonatomic, weak) UIImageView *photo;

@end

@implementation BPPhotoBrowserCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initViews];
    }
    return self;
}

- (void)initViews {
    self.layer.borderWidth = 4.0f;
    self.layer.borderColor = [UIColor colorWithRed:205/255.0 green:127/255.0 blue:50/255.0 alpha:1.0].CGColor;
    self.layer.cornerRadius = 15.0f;
    self.layer.masksToBounds = YES;
    
    UIImageView *photo = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    [self.contentView addSubview:photo];
    self.photo = photo;
}

- (void)setImagePath:(NSString *)imagePath {
    _imagePath = imagePath;
    self.photo.image = [UIImage imageNamed:imagePath];
}
@end
