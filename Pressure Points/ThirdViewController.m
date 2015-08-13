//
//  ThirdViewController.m
//  Pressure Points
//
//  Created by Carlos  Guanche on 7/9/15.
//  Copyright (c) 2015 Carlos  Guanche. All rights reserved.
//

#import "ThirdViewController.h"
#import "MPColorTools.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = MP_HSL(0.4833333, 1, 0.5);
    
    _mainTitle.font = [UIFont fontWithName:@"Lato-Black" size:45];
    _mainTitle.layer.opacity = 0.7;
    _mainTitle.textColor = MP_HSL(0.675, 0.63, 0.5);
    
    _phone.font = [UIFont fontWithName:@"Lato-Light" size:17];
    _phone.layer.opacity = 0.7;
    _phone.textColor = MP_HSL(0.675, 0.63, 0.5);
    
    _address.font = [UIFont fontWithName:@"Lato-Light" size:17];
    _address.layer.opacity = 0.7;
    _address.textColor = MP_HSL(0.675, 0.63, 0.5);
    
    _site.font = [UIFont fontWithName:@"Lato-Light" size:17];
    _site.layer.opacity = 0.7;
    _site.textColor = MP_HSL(0.675, 0.63, 0.5);
    
    _emLine.font = [UIFont fontWithName:@"Lat-Light" size:17];
    _emLine.layer.opacity = 0.7;
    _emLine.textColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
