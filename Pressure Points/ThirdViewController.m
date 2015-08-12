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
    
    _mainTitle.font = [UIFont fontWithName:@"Raleway-SemiBold" size:45];
    _mainTitle.layer.opacity = 0.7;
    //_mainTitle.textColor = [UIColor colorWithWhite:0 alpha:0.7];
    
    _phone.font = [UIFont fontWithName:@"Raleway" size:17];
    _phone.layer.opacity = 0.7;
    //_phone.textColor = [UIColor colorWithWhite:0 alpha:0.7];
    
    _address.font = [UIFont fontWithName:@"Raleway" size:17];
    _address.layer.opacity = 0.7;
    //_address.textColor = [UIColor colorWithWhite:0 alpha:0.7];
    
    _site.font = [UIFont fontWithName:@"Raleway" size:17];
    _site.layer.opacity = 0.7;
    //_site.textColor = [UIColor colorWithWhite:0 alpha:0.7];
    
    _emLine.font = [UIFont fontWithName:@"Raleway" size:17];
    _emLine.layer.opacity = 0.7;
    //_emLine.textColor = [UIColor colorWithWhite:0 alpha:0.7];
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
