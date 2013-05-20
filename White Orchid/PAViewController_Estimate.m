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
    
    //NSLog(@"The value is %d", [ListValue]);

    //Create Room Values
    int Base = 3;
    int Basement;
    int Office;
    int GreatRoom;
    int BreakfastNook;
    int Patio;
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
    int RoomValue = Base + Basement + Office + GreatRoom + BreakfastNook + Patio;
    
    NSLog(@"The room muiltiplyer is %d", RoomValue);
    
    //Calulate Dollar Muiltiplyer
    //Create state variable...
    
//    if ([ListValue] < 400000 && RoomValue < 4) {
//        RoomValue = 4;
//    }
//    if (ListValue < 400000) {
//        $dollar = 150;
//    } elseif (ListValue >= 400000 && ListValue < 800000) {
//        $dollar = 250;
//    } elseif (ListValue >= 800000 && ListValue < 1200000) {
//        $dollar = 300;
//    } elseif (ListValue >= 1200000 && ListValue < 5000000) {
//        $dollar = 400;
//    } elseif (ListValue >= 5000000 && ListValue < 10000000) {
//        $dollar = 500;
//    } elseif (ListValue >= 10000000) {
//        $dollar = 600;
//    }
//    if (ListValue < 400000) {
//        $servicemuiltiplyer = 1;
//    } elseif (ListValue >= 400000 && ListValue < 800000) {
//        $servicemuiltiplyer = 1;
//    } elseif (ListValue >= 800000 && ListValue < 1200000) {
//        $servicemuiltiplyer = 1.5;
//    } elseif (ListValue >= 1200000 && ListValue < 5000000) {
//        $servicemuiltiplyer = 2;
//    } elseif (ListValue >= 5000000 && ListValue < 10000000) {
//        $servicemuiltiplyer = 2;
//    } elseif (ListValue >= 10000000) {
//        $servicemuiltiplyer = 2;
//    }
//    $rentalfee = RoomValue * $dollar;
//    $servicefee = $rentalfee * $servicemuiltiplyer;
//    $total = $rentalfee + $servicefee;

    
    
    if (ListValue == nil) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You forgot to enter a list price" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
    } else {
        if ([EstimateVacant isOn] == YES) {
            [EstimateResult setText:@"Stage Your Home from $150 with a White Orchid Design Coordinator"];
        } else {
            if (ListValue > 0) {
                [EstimateResult setText:@"Value > 0"];
            }
        }
    }
    


//    //Post Variables
//    $state = $_GET["state"];
//    $list = $_GET["list"];
//    $roomvalue = $_GET["roomvalue"];
//    if ($list < 400000 && $roomvalue < 4) {$roomvalue = 4;}
//    if ($list < 400000) {
//        $dollar = 150;
//    } elseif ($list >= 400000 && $list < 800000) {
//        $dollar = 250;
//    } elseif ($list >= 800000 && $list < 1200000) {
//        $dollar = 300;
//    } elseif ($list >= 1200000 && $list < 5000000) {
//        $dollar = 400;
//    } elseif ($list >= 5000000 && $list < 10000000) {
//        $dollar = 500;
//    } elseif ($list >= 10000000) {
//        $dollar = 600;
//    }
//    if ($list < 400000) {
//        $servicemuiltiplyer = 1;
//    } elseif ($list >= 400000 && $list < 800000) {
//        $servicemuiltiplyer = 1;
//    } elseif ($list >= 800000 && $list < 1200000) {
//        $servicemuiltiplyer = 1.5;
//    } elseif ($list >= 1200000 && $list < 5000000) {
//        $servicemuiltiplyer = 2;
//    } elseif ($list >= 5000000 && $list < 10000000) {
//        $servicemuiltiplyer = 2;
//    } elseif ($list >= 10000000) {
//        $servicemuiltiplyer = 2;
//    }
//    $rentalfee = $roomvalue * $dollar;
//    $servicefee = $rentalfee * $servicemuiltiplyer;
//    $total = $rentalfee + $servicefee;
//    ?>
//    <?php get_header(); ?>
//    <?php if(have_posts()) : the_post(); ?>
//    <?php require('banner.php'); ?>
//    <?php $type = $_GET["type"]; if ($type=='Vacant') { ?>
//        <div class="contentwindow_wrapper">
//        <div class="html_wrapper quote-result">
//        <?php while(the_flexible_field("sections")): ?>
//            <?php if(get_row_layout() == "content"): ?>
//                <?php the_sub_field('content'); ?>
//        <?php elseif(get_row_layout() == "quote_result"): ?>
//        <h1 class='estimate'>
//        <?php the_sub_field('text_before'); ?><?php echo number_format($total); ?><?php the_sub_field('text_after'); ?>
//        
//        </h1>
//        <?php endif; ?>
//        <?php endwhile; ?>
//        </div>
//        </div>
//        <?php } else { ?>
//            <div class="contentwindow_wrapper">
//            <div class="html_wrapper quote-result">
//            <?php the_field('occupied_staging_content'); ?>
//            </div>
//            </div>
//            <?php } ?>
    
    
    
    
    
}

@end
