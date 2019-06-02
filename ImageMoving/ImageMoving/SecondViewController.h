//
//  SecondViewController.h
//  ImageMoving
//
//  Created by Hanna Rybakova on 6/1/19.
//  Copyright © 2019 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondVCDelegate.h"

@interface SecondViewController : UIViewController
@property (nonatomic, weak) id<SecondVCDelegate> delegate;
@end
