//
//  CustomView.h
//  ImageMoving
//
//  Created by Hanna Rybakova on 6/1/19.
//  Copyright © 2019 None. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView
@property (nonatomic, strong) NSString *Description;

- (id)initWithId:(uint)number title:(NSString *)theTitle;
- (void)hideLabel;
@end

