//
//  FourthViewController.h
//  Pressure Points
//
//  Created by Carlos  Guanche on 7/9/15.
//  Copyright (c) 2015 Carlos  Guanche. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PointEntryTableViewCell.h"

@interface FourthViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *remainingView;
@property (weak, nonatomic) IBOutlet UILabel *remainingText;
@property (weak, nonatomic) IBOutlet UILabel *remainingLabel;

@property (weak, nonatomic) IBOutlet UIView *redeemedView;
@property (weak, nonatomic) IBOutlet UILabel *redeemedText;
@property (weak, nonatomic) IBOutlet UILabel *redeemedLabel;

@property (strong, nonatomic) IBOutlet UITableView *pointEntries;

@property (weak, nonatomic) IBOutlet UITabBarItem *barButton;

@property (strong, nonatomic) UIView *shadBox;

- (void)updateLabels;

@end
