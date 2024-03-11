//
//  PictureViewCell.m
//  HelloWorld
//
//  Created by  huwenqiang on 2024/3/5.
//

#import "PictureViewCell.h"
#import <SDWebImage.h> //建议包含框架

@implementation PictureViewCell
//多余空行

-(instancetype)initWithFrame:(CGRect)frame {
    self=[super initWithFrame:frame];
    if (self) {
        self.imageView=[[UIImageView alloc] initWithFrame:self.frame];
        //self.imageView.contentMode=UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.imageView];
    }
     
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
                [self.imageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor],
                [self.imageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor],
                [self.imageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor],
                [self.imageView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor]
            ]];
    
    return self;
}

-(void)layoutPictureViewCell:(NSString *)urlString {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:urlString] 
                             completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        //NSLog(@"hu: %@", urlString);
    }];
}

@end
