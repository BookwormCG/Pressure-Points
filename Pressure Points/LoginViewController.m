//
//  LoginViewController.m
//  Pressure Points
//
//  Created by Carlos  Guanche on 7/7/15.
//  Copyright (c) 2015 Carlos  Guanche. All rights reserved.
//

#import "LoginViewController.h"
#import "FirstViewController.h"
#import "TermsViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)login:(id)sender
{
    
    if (([self.pinBox.text intValue] !=0)&&([self.pinBox.text intValue]== (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"PIN"])) {
        
        //UIStoryboard *stbrd = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        //FirstViewController *home = [stbrd instantiateInitialViewController];
        
        //[home setPresentationStyle: UIModalPresentationFullScreen];
        
        //[self presentViewController:home animated:YES completion:nil];
        
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

-(IBAction)acct:(id)sender
{
    //create the next view you want
    TermsViewController *terms = [[TermsViewController alloc] init];
    
    //by pushing the view onto your controller, you immediately have it pop up on screen
    [self.navigationController pushViewController:terms animated:YES];
    
}

-(IBAction)textBox:(id)sender
{
    /*
    if ([self.pinBox.text isEqualToString: [NSString stringWithFormat:@"%ld",(long)[NSUserDefaults.standardUserDefaults integerForKey:@"PIN"]]]) {
        
        FirstViewController *home = [[FirstViewController alloc] init];
        
        [self presentViewController:home animated:YES completion:nil];
    }*/
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
