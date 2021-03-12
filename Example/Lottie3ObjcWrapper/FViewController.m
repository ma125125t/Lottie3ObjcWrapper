//
//  FViewController.m
//  Lottie3ObjcWrapper
//
//  Created by FFFang on 03/12/2021.
//  Copyright (c) 2021 FFFang. All rights reserved.
//

#import "FViewController.h"
@import Lottie3ObjcWrapper;

@interface FViewController ()

@end

@implementation FViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    LottieAnimationView *loader = [[LottieAnimationView alloc] initWithFrame:CGRectMake(0, 100, 300, 300)];
    loader.loop = false;
    [loader loadAnimationWithName:@"demo"];
    [loader playWithCompletion:nil];
    [self.view addSubview:loader];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
