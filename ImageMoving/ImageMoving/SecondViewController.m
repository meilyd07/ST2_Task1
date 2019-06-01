//
//  SecondViewController.m
//  ImageMoving
//
//  Created by Hanna Rybakova on 6/1/19.
//  Copyright © 2019 None. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self addConstraints];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self addConstraints];
    
}

- (void)addConstraints {
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *pinContentLeading = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0];
    NSLayoutConstraint *pinContentTrailing = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0];
    NSLayoutConstraint *pinContentTop = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0];
    NSLayoutConstraint *pinContentBottom = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0];
    [self.contentView addConstraint:pinContentLeading];
    [self.contentView addConstraint:pinContentTrailing];
    [self.contentView addConstraint:pinContentTop];
    [self.contentView addConstraint:pinContentBottom];
     
    NSLayoutConstraint *pinScrollLeading = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0];
    NSLayoutConstraint *pinScrollTrailing = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0];
    NSLayoutConstraint *pinScrollTop = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0];
    NSLayoutConstraint *pinScrollBottom = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0];
    [self.scrollView addConstraint:pinScrollLeading];
    [self.scrollView addConstraint:pinScrollTrailing];
     [self.scrollView addConstraint:pinScrollTop];
     [self.scrollView addConstraint:pinScrollBottom];
    
    [NSLayoutConstraint constraintWithItem:self.contentView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:1.0f
                                  constant:0];
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
