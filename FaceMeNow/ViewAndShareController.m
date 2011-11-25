//
//  ViewAndShareController.m
//  MockMe
//
//  Created by Jaume Cornadó on 22/11/11.
//  Copyright (c) 2011 Bazinga Systems. All rights reserved.
//

#import "ViewAndShareController.h"
#import "ShareController.h"

@implementation ViewAndShareController
@synthesize previewImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setPreviewImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)close:(id)sender {
    [[self view] removeFromSuperview];
}

-(IBAction)openShareView:(id)sender {
    ShareController *shareController = [[ShareController alloc] initWithNibName:@"ShareController" bundle:nil];
    shareController.view.frame = self.view.frame;
    
    [UIView beginAnimations:@"view Transition" context:nil];
    
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
      
   
   
    [self.view addSubview:shareController.view];
    [self.view sendSubviewToBack:shareController.view];
    
    [UIView commitAnimations];

    
    
}

@end
