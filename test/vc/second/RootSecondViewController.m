//
//  RootSecondViewController.m
//  test
//
//  Created by sang alfred on 11/24/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "RootSecondViewController.h"

#import "CustomTabBarViewController.h"

@interface RootSecondViewController ()

@end

@implementation RootSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom ;
        [self setTitle:@"second level"];
//        self.navigationController.navigationBarHidden = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [CustomTabBarViewController hide:YES animated:YES] ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
