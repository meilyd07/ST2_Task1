//
//  SecondVCDelegate.h
//  ImageMoving
//
//  Created by Hanna Rybakova on 6/2/19.
//  Copyright © 2019 None. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomView.h"

@protocol SecondVCDelegate <NSObject>

@required
- (void)secondVCDidDismisWithData:(CustomView*)data;
@end
