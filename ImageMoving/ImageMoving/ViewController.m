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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@""];
    
    UIBarButtonItem *showAddButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pressAdd:)];
    
    self.navigationItem.rightBarButtonItem = showAddButton;
}

-(void)pressAdd:(id)sender
{
    SecondViewController *vc = [[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
    
    [self.navigationController pushViewController:vc animated:false];
}
@end
