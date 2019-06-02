//
//  ViewController.m
//  ImageMoving
//
//  Created by Hanna Rybakova on 5/31/19.
//  Copyright © 2019 None. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)secondVCDidDismisWithData:(CustomView*)data {
    [self.navigationController popViewControllerAnimated:YES];
    [self.view addSubview:data];
    [self setCustomViewConstraints:data];
    [self setTitle:data.title];
}

- (void)setCustomViewConstraints:(CustomView*)data {
    [data setContentMode:UIViewContentModeScaleAspectFit];
    [data addConstraint:[NSLayoutConstraint constraintWithItem:data attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100]];
    NSLayoutConstraint *centerCustomX = [NSLayoutConstraint constraintWithItem:data attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *centerCustomY = [NSLayoutConstraint constraintWithItem:data attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    [self.view addConstraint:centerCustomX];
    [self.view addConstraint:centerCustomY];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@""];
    
    UIBarButtonItem *showAddButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pressAdd:)];
    
    self.navigationItem.rightBarButtonItem = showAddButton;
    
    self.view.backgroundColor = [UIColor yellowColor];
}

-(void)pressAdd:(id)sender
{
    SecondViewController *vc = [[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
