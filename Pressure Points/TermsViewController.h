//
//  TermsViewController.h
//  Pressure Points
//
//  Created by Carlos  Guanche on 7/7/15.
//  Copyright (c) 2015 Carlos  Guanche. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TermsViewController : UIViewController

#pragma mark - Props

@property (weak, nonatomic) IBOutlet UITextField *nameBox;
@property (weak, nonatomic) IBOutlet UITextField *textPinBox;
@property (weak, nonatomic) IBOutlet UIButton *subButton;
@property (weak, nonatomic) IBOutlet UITextView *termsBox;

#pragma mark - Methods

- (IBAction)nameEnter:(id)sender;
- (IBAction)newPinEnter:(id)sender;
- (IBAction)clickSub:(id)sender;

@end
