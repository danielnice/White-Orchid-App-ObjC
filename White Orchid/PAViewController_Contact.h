//
//  PAViewController_Contact.h
//  White Orchid
//
//  Created by Timothy Nice on 6/13/13.
//  Copyright (c) 2013 Daniel Nice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PAViewController_Contact : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *facebook;
- (IBAction)web_facebook:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *twitter;
- (IBAction)web_twitter:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *linkedin;
- (IBAction)web_linkedin:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *youtube;
- (IBAction)web_youtube:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *callCA;
- (IBAction)callCA:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *callCO;
- (IBAction)callCO:(id)sender;

@end
