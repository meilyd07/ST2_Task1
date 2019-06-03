//
//  ViewController.m
//  ImageMoving
//
//  Created by Hanna Rybakova on 5/31/19.
//  Copyright © 2019 None. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@implementation ViewController

- (void)secondVCDidDismisWithData:(CustomView*)data {
    [self.navigationController popViewControllerAnimated:YES];
    [self.view addSubview:data];
    [self setCustomViewPosition:data];
}

- (void)setCustomViewPosition:(CustomView*)data {
    data.translatesAutoresizingMaskIntoConstraints = YES;
    double pointx = self.view.frame.size.width / 2 - 50;
    double pointy = self.view.frame.size.height / 2 - 50;
    [data setFrame:CGRectMake(pointx, pointy, 100, 100)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"ImageMoving"];
    self.view.multipleTouchEnabled = NO;
    
    UIBarButtonItem *showAddButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pressAdd:)];
    
    self.navigationItem.rightBarButtonItem = showAddButton;
}

-(void)pressAdd:(id)sender
{
    SecondViewController *vc = [[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
