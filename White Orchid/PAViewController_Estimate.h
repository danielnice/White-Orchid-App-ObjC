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
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *EstimatePhone;
@property (weak, nonatomic) IBOutlet UITextField *EstimateEmail;
@property (weak, nonatomic) IBOutlet UITextField *EstimateListPrice;


@property (weak, nonatomic, getter=isOn) IBOutlet UISwitch *EstimateVacant;
@property (weak, nonatomic, getter=isOn) IBOutlet UISwitch *EstimateSelectOffice;
@property (weak, nonatomic, getter=isOn) IBOutlet UISwitch *EstimateSelectGreatRoom;
@property (weak, nonatomic, getter=isOn) IBOutlet UISwitch *EstimateSelectBreakfastNook;
@property (weak, nonatomic, getter=isOn) IBOutlet UISwitch *EstimateSelectBasement;
@property (weak, nonatomic, getter=isOn) IBOutlet UISwitch *EstimateSelectPatio;

@property (weak, nonatomic) IBOutlet UISegmentedControl *EstimateStyle;

@property (weak, nonatomic) IBOutlet UILabel *EstimateResult;

@property (weak, nonatomic) IBOutlet UISegmentedControl *StateSelect;

@end
