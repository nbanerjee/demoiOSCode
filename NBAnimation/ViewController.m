//
//  ViewController.m
//  NBAnimation
//
//  Created by Nabarun Banerjee on 16/12/13.
//  Copyright (c) 2013 Kreeti Technologies. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  // Load images
  NSArray *imageNames = @[@"win_1.png", @"win_2.png", @"win_3.png", @"win_4.png",
                          @"win_5.png", @"win_6.png", @"win_7.png", @"win_8.png",
                          @"win_9.png", @"win_10.png", @"win_11.png", @"win_12.png",
                          @"win_13.png", @"win_14.png", @"win_15.png", @"win_16.png"];
  
  NSMutableArray *images = [[NSMutableArray alloc] init];
  for (int i = 0; i < imageNames.count; i++) {
    [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
  }
  
  // Normal Animation
  UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 95, 86, 193)];
  animationImageView.animationImages = images;
  animationImageView.animationDuration = 0.5;
  
  UIImageView *slowAnimationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(146, 95, 86, 193)];
  slowAnimationImageView.animationImages = images;
  slowAnimationImageView.animationDuration = 1.0;
  
  [self.view addSubview:animationImageView];
  [animationImageView startAnimating];  
  [self.view addSubview:slowAnimationImageView];
  [slowAnimationImageView startAnimating];
  
  [self startKeyFrameAnimation];  
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark private functions

-(void)startKeyFrameAnimation{
  CALayer *layer = [CALayer layer];
  [layer setPosition:CGPointMake(50.0, 50.0)];
  [layer setBounds:CGRectMake(0.0, 0.0, 128.0, 128.0)];
  [layer setBackgroundColor:[[UIColor colorWithPatternImage:[UIImage imageNamed:@"sweet_angel.png"]] CGColor]];
  [self.view.layer addSublayer:layer];
  
  CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
  NSArray *times = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.33], [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:1.0], nil];
  [anim setKeyTimes:times];
  
  NSArray *values = [NSArray arrayWithObjects:[NSValue valueWithCGPoint: CGPointMake(0., 50.)], [NSValue valueWithCGPoint: CGPointMake(0., 350.)], [NSValue valueWithCGPoint: CGPointMake(320., 350.)], [NSValue valueWithCGPoint: CGPointMake(320., 50.)], nil];
  [anim setValues:values];
  [anim setDuration:6.0];
  [anim setRepeatCount:HUGE_VALF];
  [layer addAnimation:anim forKey:@"position"];
}

-(void)stopAnimation{
  
}

@end
