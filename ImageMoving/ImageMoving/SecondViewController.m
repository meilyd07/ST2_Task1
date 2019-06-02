//
//  SecondViewController.m
//  ImageMoving
//
//  Created by Hanna Rybakova on 6/1/19.
//  Copyright © 2019 None. All rights reserved.
//

#import "SecondViewController.h"
#import "CustomView.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Select Item"];
    
    UIBarButtonItem *closeButton = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(pressClose)];
    self.navigationItem.rightBarButtonItem = closeButton;
    
    [self populateContent];
    [self addScrollConstraints];
}

- (void)pressClose {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)populateContent {
    NSArray *_titleArray = @[@"https://loremflickr.com/cache/resized/65535_47770358311_ed044d81fa_n_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/4839_46926069422_7e7a760bee_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/7913_47475906952_c6519538c6_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/65535_33788346308_2d66e52e15_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/7922_47227182442_a266596c0f_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/4898_46679574984_765e6b52e0_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/65535_40811234203_48d1190ec4_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/7447_9408095357_196a44413a_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/2720_4097907932_eb208f3042_n_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/65535_40924177063_5e80b3ccfd_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/7927_40504445713_4bff07fc27_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/7890_46965722211_d1bf37288f_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/65535_40729969893_482bfe8b05_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/1495_25243373896_00fa61f4eb_n_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/7375_9043183128_4803f37b97_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/7926_47499091882_0a1b1afb0f_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/65535_33744143688_3cac5ed48c_320_240_g.jpg",
         @"https://loremflickr.com/cache/resized/7818_47530379011_6b2214d11a_320_240_g.jpg",
         @"https://loremflickr.com/cache/resized/7879_46612728145_91f14bd25c_320_240_g.jpg",
         @"https://loremflickr.com/cache/resized/65535_47939964192_bb556f6c90_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/201_442017130_5b94c644c9_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/7879_32371004727_b45f061741_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/65535_47709833542_5efac91d69_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/7844_47084062491_6dafeca912_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/7902_46317421004_7ed71a8943_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/65535_47942418853_ba3c606912_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/7826_47190013102_7bfa672bc4_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/4911_46959780851_58738a2083_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/7871_46491920275_fcc6b968dd_n_320_240_nofilter.jpg",
         @"https://loremflickr.com/cache/resized/65535_32800932737_455186f6a0_320_240_nofilter.jpg"];
    
    UIView *previousView = nil;
    
    for (int i = 0; i<30; i++) {
        CustomView *cv = [[CustomView alloc] initWithId:i title:_titleArray[i]];
        
        UITapGestureRecognizer *singleFingerTap =
        [[UITapGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(handleSingleTap:)];
        [cv addGestureRecognizer:singleFingerTap];
        
        cv.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:cv];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:cv attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];

        if (previousView == nil) {
            [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:cv attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
        } else {
            [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:previousView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:cv attribute: NSLayoutAttributeTop multiplier:1 constant:0]];
        }
    
        previousView = cv;
    }
    if (previousView != nil) {
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:previousView attribute: NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute: NSLayoutAttributeBottom multiplier:1 constant: 0]];
    }
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    [_delegate secondVCDidDismisWithData:(CustomView *)recognizer.view];
    
}

- (void)addScrollConstraints {
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *equalWidth = [NSLayoutConstraint constraintWithItem:self.contentView
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeWidth
                                                                 multiplier:1.0f
                                                                   constant:0];
    [self.view addConstraint:equalWidth];
    
    NSLayoutConstraint *pinScrollLeading = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0];
    NSLayoutConstraint *pinScrollTrailing = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0];
    NSLayoutConstraint *pinScrollTop = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0];
    NSLayoutConstraint *pinScrollBottom = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0];
    [self.view addConstraint:pinScrollLeading];
    [self.view addConstraint:pinScrollTrailing];
    [self.view addConstraint:pinScrollTop];
    [self.view addConstraint:pinScrollBottom];
    
    NSLayoutConstraint *pinContentLeading = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0];
    NSLayoutConstraint *pinContentTrailing = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0];
    NSLayoutConstraint *pinContentTop = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0];
    NSLayoutConstraint *pinContentBottom = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0];
    [self.scrollView addConstraint:pinContentLeading];
    [self.scrollView addConstraint:pinContentTrailing];
    [self.scrollView addConstraint:pinContentTop];
    [self.scrollView addConstraint:pinContentBottom];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
