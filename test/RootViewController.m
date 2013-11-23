//
//  RootViewController.m
//  test
//
//  Created by sang alfred on 11/23/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
- (IBAction)first:(id)sender;

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIButton *b = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [b setTitle:@"va" forState:UIControlStateNormal];
    
    b.frame = CGRectMake(0, 100, 320, 40);
    [b addTarget:self action:@selector(identi) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
    
}

-(void)identi{
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)first:(id)sender {
    
    NSString *str = [[NSString alloc] initWithFormat:@"%@",@"ddd"];
    
    for (int i=0; i<100000; i++) {
        UIViewController *c = [[UIViewController alloc] init];
        
          
    }
    
    NSLog(@"dddd");
}
@end
