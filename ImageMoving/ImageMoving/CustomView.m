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

- (id)initWithId:(uint)number title:(NSString *)theTitle {
    NSString *imageName = [[NSString alloc] initWithFormat:@"%d", number];
    self.originalImage = [UIImage imageNamed: imageName];
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self setTitle:theTitle];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self.originalImage drawInRect:CGRectMake(0.f, 0.f, self.originalImage.size.width, self.originalImage.size.height)];
}

- (CGSize)intrinsicContentSize
{
    return self.originalImage.size;
}

@end
