//
//  TermsViewController.m
//  Pressure Points
//
//  Created by Carlos  Guanche on 7/7/15.
//  Copyright (c) 2015 Carlos  Guanche. All rights reserved.
//

#import "TermsViewController.h"
#import "LoginViewController.h"
#import "Masonry.h"

@interface TermsViewController ()

@end

@implementation TermsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.termsBox.layer.borderWidth = .5f;
    self.termsBox.layer.borderColor = [[UIColor blackColor] CGColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nameEnter:(id)sender
{
    
}

- (IBAction)newPinEnter:(id)sender
{
    
}

- (IBAction)clickSub:(id)sender
{
    if ([self.nameBox.text length] > 0 && [self.textPinBox.text length] == 4) {
        [[NSUserDefaults standardUserDefaults] setObject:self.nameBox.text forKey:@"userName"];
        [[NSUserDefaults standardUserDefaults] setInteger:[self.textPinBox.text intValue] forKey:@"PIN"];
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"remainingPoints"];
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"redeemedPoints"];
        
        NSMutableArray *pointInputs = [[NSMutableArray alloc]init];
        
        NSData *json = [NSJSONSerialization dataWithJSONObject:pointInputs options:NSJSONWritingPrettyPrinted error:nil];
        
        [[NSUserDefaults standardUserDefaults] setObject:json forKey:@"entries"];
        
        //creates a counter for points that have been redeemed but have not yet expired
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"rNotE"];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
