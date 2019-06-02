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
@property (nonatomic, weak) UIView *movingView;
@end

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

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    //determine view selected
    UIView *view = [self.view hitTest:point withEvent:event];
    if (![view isEqual:self.view]) {
        NSString *string = [(CustomView *)view Description];
        [self setTitle:string];
        self.movingView = view;
    } else {
        [self setTitle:@"ImageMoving"];
        self.movingView = nil;
    }
    
}
    -(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
        if (self.movingView) {
            UITouch *touch = [touches anyObject];
            CGPoint point = [touch locationInView:self.view];
            self.movingView.center = point;
        }
    }

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.movingView = nil;
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.movingView = nil;
}

@end
