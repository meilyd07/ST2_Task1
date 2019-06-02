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
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation CustomView

- (id)initWithId:(uint)number title:(NSString *)theTitle {
    NSString *imageName = [[NSString alloc] initWithFormat:@"%d", number];
    self.originalImage = [UIImage imageNamed: imageName];
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self setDescription:theTitle];
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, self.originalImage.size.height - 70.f, self.originalImage.size.width, 120)];
        
        self.titleLabel.text=theTitle;
        [self.titleLabel setNumberOfLines:3];
        [self.titleLabel sizeToFit];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)hideLabel {
    [self.titleLabel setHidden:YES];
}

- (void)drawRect:(CGRect)rect {
    [self.originalImage drawInRect:CGRectMake(0.f, 0.f, self.originalImage.size.width, self.originalImage.size.height)];
}

- (CGSize)intrinsicContentSize
{
    return self.originalImage.size;
}

@end
