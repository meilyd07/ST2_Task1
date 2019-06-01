//
//  CustomView.m
//  ImageMoving
//
//  Created by Hanna Rybakova on 6/1/19.
//  Copyright © 2019 None. All rights reserved.
//

#import "CustomView.h"

@interface CustomView()
@property (nonatomic, strong) UIImage *originalImage;
@end

@implementation CustomView

- (id)initWithId:(uint)number title:(NSString *)theTitle position:(CGPoint)point {
    NSString *imageName = [[NSString alloc] initWithFormat:@"%d", number];
    self.originalImage = [UIImage imageNamed: imageName];
    CGFloat imgWidth = self.originalImage.size.width;
    CGFloat imgHeight = self.originalImage.size.height;
    self = [super initWithFrame:CGRectMake(point.x, point.y, imgWidth, imgHeight)];
    if (self) {
        [self setTitle:theTitle];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
//    UIImage *_originalImage = [UIImage imageNamed: @"3"];
//    [_originalImage drawInRect:CGRectMake(0.f, 0.f, _originalImage.size.width, _originalImage.size.height)];

    [self.originalImage drawInRect:CGRectMake(0.f, 0.f, self.originalImage.size.width, self.originalImage.size.height)];
}


@end
