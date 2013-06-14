//
//  PAViewController_Contact.m
//  White Orchid
//
//  Created by Timothy Nice on 6/13/13.
//  Copyright (c) 2013 Daniel Nice. All rights reserved.
//

#import "PAViewController_Contact.h"

@interface PAViewController_Contact ()

@end

@implementation PAViewController_Contact
@synthesize facebook;
@synthesize linkedin;
@synthesize twitter;
@synthesize youtube;
@synthesize callCA, callCO;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)web_facebook:(id)sender {
   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/WhiteOrchidInteriors"]];
}

- (IBAction)web_twitter:(id)sender {
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/intent/tweet?source=webclient&text=About+White+Orchid+Interiors+http%3A%2F%2Fwww.home-staging-colorado.com%2Fhome%2Fabout%2F"]];
}

- (IBAction)web_linkedin:(id)sender {
   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.linkedin.com/company/1248936?trk=tyah"]];
}

- (IBAction)web_youtube:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.youtube.com/whiteorchidinteriors"]];

}
- (IBAction)callCA:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://9494158850"]];
}
- (IBAction)callCO:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://7204468850"]];
}

@end
