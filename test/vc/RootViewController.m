//
//  RootViewController.m
//  test
//
//  Created by sang alfred on 11/23/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "RootViewController.h"
#import "RootSecondViewController.h"
#import "CustomTabBarViewController.h"

@interface RootViewController ()
- (IBAction)first:(id)sender;

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setTitle:@"root level"];
  
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [CustomTabBarViewController hide:NO animated:YES] ;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"root";
    
    UIButton *button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [button setTitle: @"自定义title" forState: UIControlStateNormal];
    [button sizeToFit];
    self.navigationItem.titleView = button;
}

-(void)identi{
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)first:(id)sender {
    RootSecondViewController *rs = [[RootSecondViewController alloc] init];
    [self.navigationController pushViewController:rs animated:YES];
}
@end
