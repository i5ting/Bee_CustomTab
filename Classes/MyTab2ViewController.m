//
//  MyTab2ViewController.m
//  SimpleEKDemo
//
//  Created by sang alfred on 11/23/13.
//
//

#import "MyTab2ViewController.h"

@interface MyTab2ViewController ()

@end

@implementation MyTab2ViewController

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
	// Do any additional setup after loading the view.
    
    UIButton *b = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [b setTitle:@"va" forState:UIControlStateNormal];
    
    b.frame = CGRectMake(0, 100, 320, 40);
    [b addTarget:self action:@selector(identi) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
    
    b = nil;
    
}

-(void)identi{


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
