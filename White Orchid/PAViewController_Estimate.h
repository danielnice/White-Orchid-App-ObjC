//
//  PAViewController_Estimate.h
//  White Orchid
//
//  Created by Daniel Nice on 5/18/13.
//  Copyright (c) 2013 Daniel Nice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PAViewController_Estimate : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *EstimateSubmit;
- (IBAction)buttonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *EstimateName;
@property (weak, nonatomic) IBOutlet UITextField *EstimatePhone;

@property (weak, nonatomic) IBOutlet UITextField *EstimateEmail;
@property (weak, nonatomic) IBOutlet UITextField *EstimateListPrice;

@property (weak, nonatomic) IBOutlet UISegmentedControl *EstimateVacant;
@property (weak, nonatomic) IBOutlet UISegmentedControl *EstimateSelectOffice;
@property (weak, nonatomic) IBOutlet UISegmentedControl *EstimateSelectGreatRoom;
@property (weak, nonatomic) IBOutlet UISegmentedControl *EstimateSelectBreakfastNook;
@property (weak, nonatomic) IBOutlet UISegmentedControl *EstimateSelectBasement;
@property (weak, nonatomic) IBOutlet UISegmentedControl *EstimateSelectPatio;

@property (weak, nonatomic) IBOutlet UISegmentedControl *EstimateStyle;

@property (weak, nonatomic) IBOutlet UILabel *EstimateResult;

@property (weak, nonatomic) IBOutlet UISegmentedControl *StateSelect;

@end
