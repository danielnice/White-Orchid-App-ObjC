//
//  PAViewController_Estimate.m
//  White Orchid
//
//  Created by Daniel Nice on 5/18/13.
//  Copyright (c) 2013 Daniel Nice. All rights reserved.
//

#import "PAViewController_Estimate.h"

@interface PAViewController_Estimate ()

@end

@implementation PAViewController_Estimate
@synthesize EstimateResult;
@synthesize EstimateName;
@synthesize EstimateEmail;
@synthesize EstimatePhone;
@synthesize EstimateListPrice;
@synthesize EstimateVacant;
@synthesize EstimateSelectOffice;
@synthesize EstimateSelectGreatRoom;
@synthesize EstimateSelectBreakfastNook;
@synthesize EstimateSelectBasement;
@synthesize EstimateSelectPatio;
@synthesize StateSelect;


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


- (IBAction)buttonPressed:(id)sender {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    NSNumber * ListValue = [f numberFromString:[EstimateListPrice text]];
    int ListValueInt = [ListValue intValue];
    
    //State Select Text
//    NSString *State;
//    if([StateSelect selectedSegmentIndex] == 0){
//        State = @"Colorado";
//    }
//    else if([StateSelect selectedSegmentIndex] == 1){
//        State = @"California";
//    }
//    NSLog(@"State = %@", State);

//Create Room Values
    float Base = 3;
    float Basement;
    float Office;
    float GreatRoom;
    float BreakfastNook;
    float Patio;
    if([EstimateSelectBasement isOn] == YES){
        Basement = 2;
    } else {
        Basement = 0;
    }
    if([EstimateSelectOffice isOn] == YES){
        Office = 0.5;
    } else {
        Office = 0;
    }
    if([EstimateSelectGreatRoom isOn] == YES){
        GreatRoom = 1;
    } else {
        GreatRoom = 0;
    }
    if([EstimateSelectBreakfastNook isOn] == YES){
        BreakfastNook = 1;
    } else {
        BreakfastNook = 0;
    }
    if([EstimateSelectPatio isOn] == YES){
        Patio = 1;
    } else {
        Patio = 0;
    }
    float RoomValue = Base + Basement + Office + GreatRoom + BreakfastNook + Patio;
// Make Minimum 4 for Colorado house under $400,000
    if([StateSelect selectedSegmentIndex] == 0){ //Colorado
        if (ListValueInt < 400000 && RoomValue < 4) {
            RoomValue = 4;
        }
    }

    //NSLog(@"Room value = %.1f", RoomValue);
    
    //Calulate Dollar & Service Muiltiplyer
    int dollar;
    float servicemuiltiplyer;
    
    if([StateSelect selectedSegmentIndex] == 0){ //Colorado
        //Calulate Dollar Muiltiplyer for CO
        if (ListValueInt < 400000) {
            dollar = 150;
        } else if (ListValueInt >= 400000 && ListValueInt < 800000) {
            dollar = 250;
        } else if (ListValueInt >= 800000 && ListValueInt < 1200000) {
            dollar = 300;
        } else if (ListValueInt >= 1200000 && ListValueInt < 5000000) {
            dollar = 400;
        } else if (ListValueInt >= 5000000 && ListValueInt < 10000000) {
            dollar = 500;
        } else {
            dollar = 600;
        }
        //Create Service Muiltiplyer for CO
        if (ListValueInt < 400000) {
            servicemuiltiplyer = 1;
        } else if (ListValueInt >= 400000 && ListValueInt < 800000) {
            servicemuiltiplyer = 1;
        } else if (ListValueInt >= 800000 && ListValueInt < 1200000) {
            servicemuiltiplyer = 1.5;
        } else if (ListValueInt >= 1200000 && ListValueInt < 5000000) {
            servicemuiltiplyer = 2;
        } else if (ListValueInt >= 5000000 && ListValueInt < 10000000) {
            servicemuiltiplyer = 2;
        } else {
            servicemuiltiplyer = 2;
        }
    } else if([StateSelect selectedSegmentIndex] == 1){ //California
        //Calulate Dollar Muiltiplyer for CA
        if (ListValueInt < 2000000) {
            dollar = 400;
        } else if (ListValueInt >= 2000000 && ListValueInt < 4000000) {
            dollar = 600;
        } else {
            dollar = 800;
        }
        //Return Service Muiltipler for CA
        servicemuiltiplyer = 2;
    }
    
    //NSLog(@"Dollar = %d", dollar);
    //NSLog(@"Service Muiltiplyer = %.2f", servicemuiltiplyer);
    
    //Calculate total cost
    int rentalfee = RoomValue * dollar;
    //NSLog(@"Rental Fee = %d", rentalfee);
    
    int servicefee = rentalfee * servicemuiltiplyer;
    //NSLog(@"Service Fee = %d", servicefee);
    
    int total = rentalfee + servicefee;
    //NSLog(@"Total = %d", total);

    //Run Calulcation
    if (ListValue == nil) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You forgot to enter a list price" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
    } else {
        if ([EstimateVacant isOn] == YES) {
            [EstimateResult setText:@"Stage Your Home from $150 with a White Orchid Design Coordinator"];
        } else {
            [EstimateResult setText:[NSString stringWithFormat:@"Cost = %d", total]];
        }
    }
    
}

@end
