//
//  sssViewController.m
//  SimpleEKDemo
//
//  Created by sang on 10/17/12.
//
//

#import "sssViewController.h"
#import "CustomTabBarViewController.h"

@interface sssViewController ()
{
    int i ;
}
@end

@implementation sssViewController

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
    i = 1;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(IBAction)aaaaa:(id)sender{
    if (i%2 == 1) {
        [CustomTabBarViewController hide:YES animated:YES];
    }else{
        [CustomTabBarViewController hide:NO animated:YES];
    }

    i++;
}
@end
