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

    //Create Room Values
    float Base = 3;
    float Basement;
    float Office;
    float GreatRoom;
    float BreakfastNook;
    float Patio;
    if([EstimateSelectBasement isOn] == YES){
        Basement = 1;
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
    
    if (ListValueInt < 400000 && RoomValue < 4) {
        RoomValue = 4;
    }
    
    NSLog(@"Room value = %.1f", RoomValue);
    
    
    //Create state variable...
    
    //Calulate Dollar Muiltiplyer
    int dollar;
    
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
    
    NSLog(@"Dollar = %d", dollar);
    
    //Create Service Muiltiplyer
    float servicemuiltiplyer;
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
    
    NSLog(@"Service Muiltiplyer = %.2f", servicemuiltiplyer);
    
    //Calculate total cost
    int rentalfee = RoomValue * dollar;
    NSLog(@"Rental Fee = %d", rentalfee);
    
    int servicefee = rentalfee * servicemuiltiplyer;
    NSLog(@"Service Fee = %d", servicefee);
    
    int total = rentalfee + servicefee;
    NSLog(@"Total = %d", total);

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
