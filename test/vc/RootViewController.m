//
//  RootViewController.m
//  test
//
//  Created by sang alfred on 11/23/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "RootViewController.h"
#import "RootSecondViewController.h"

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
  
 
  
    self.view.backgroundColor = [UIColor redColor];
    self.navigationController.navigationBarHidden = NO;
    
 
    
    UIButton *b = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [b setTitle:@"va" forState:UIControlStateNormal];
    
     [self setTitle:@"root level"];
     self.title = @"My Title";
//    
//    b.frame = CGRectMake(0, 100, 320, 40);
//    [b addTarget:self action:@selector(identi) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:b];
    
    
    
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
