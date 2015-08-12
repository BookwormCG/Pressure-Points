//
//  LoginViewController.h
//  Pressure Points
//
//  Created by Carlos  Guanche on 7/7/15.
//  Copyright (c) 2015 Carlos  Guanche. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *pinBox;
@property (weak, nonatomic) IBOutlet UIButton *acctButton;

-(IBAction)login:(id)sender;
-(IBAction)acct:(id)sender;
-(IBAction)textBox:(id)sender;

@end
