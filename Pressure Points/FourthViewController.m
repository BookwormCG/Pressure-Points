//
//  FourthViewController.m
//  Pressure Points
//
//  Created by Carlos  Guanche on 7/9/15.
//  Copyright (c) 2015 Carlos  Guanche. All rights reserved.
//

#import "FourthViewController.h"
#import "DataManager.h"
#import "PointEntryTableViewCell.h"
#import "Masonry.h"
#import "MPColorTools.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_pointEntries reloadData];
    [self updateLabels];
    //_pointEntries.backgroundColor = [UIColor clearColor];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self updateLabels];
    [_pointEntries reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateLabels{
    
    //update remaining label
    int remainingPoints = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"remainingPoints"];
    if(remainingPoints != 0){
        self.remainingLabel.text = [NSString stringWithFormat:@"%d",remainingPoints];
    }else{
        self.remainingLabel.text = @"None! :(";
    }
    
    //update redeemed label
    int redeemedPoints = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"redeemedPoints"];
    if(redeemedPoints > 0){
        self.redeemedLabel.text = [NSString stringWithFormat:@"%d",redeemedPoints];
    }
    
    //[_remainingView removeConstraints:_remainingView.constraints];
    [self.remainingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(20);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.redeemedView.mas_left);
        make.bottom.equalTo(self.pointEntries.mas_top);
        //make.width.lessThanOrEqualTo(@150);
        make.height.greaterThanOrEqualTo(@110);
    }];
    _remainingView.backgroundColor = [UIColor whiteColor];
    
    //[_remainingLabel removeConstraints:_remainingLabel.constraints];
    [self.remainingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.bottom.equalTo(self.remainingView.mas_bottom).with.offset(-15);
        make.centerX.equalTo(self.remainingView.mas_centerX);
        make.centerY.equalTo(self.remainingView.mas_centerY).with.offset(20);
        make.width.greaterThanOrEqualTo(@150);
        make.height.greaterThanOrEqualTo(@40);
    }];
    //_remainingLabel.font = [UIFont fontWithName:@"Raleway-Medium" size:35];
    _remainingLabel.textColor = [UIColor colorWithWhite:0.0 alpha:0.8];
    _remainingLabel.font = [UIFont fontWithName:@"Raleway-Medium" size:35];

    //[_remainingText removeConstraints:_remainingText.constraints];
    [self.remainingText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.remainingView).with.offset(30);
        make.centerX.equalTo(self.remainingView.mas_centerX);
        make.bottom.equalTo(self.remainingView).with.offset(-60);
        make.width.greaterThanOrEqualTo(@142);
        make.height.greaterThanOrEqualTo(@21);
    }];
    //UIFont *test = [UIFont fontWithName:@"Raleway" size:17];
    //_remainingText.font = test;
    _remainingText.textColor = [UIColor colorWithWhite:0.0 alpha:1];
    _remainingText.font = [UIFont fontWithName:@"Raleway" size:17];
    
    //[_redeemedView removeConstraints:_redeemedView.constraints];
    [self.redeemedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(20);
        make.left.equalTo(self.view.mas_centerX);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.remainingView.mas_bottom);
        //make.width.lessThanOrEqualTo(@150);
        make.height.equalTo(self.remainingView.mas_height);
    }];
    _redeemedView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:1];
    

    [self.redeemedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.remainingLabel.mas_top);
        make.centerX.equalTo(self.redeemedView.mas_centerX);
        make.bottom.equalTo(self.remainingLabel.mas_bottom);
        make.width.greaterThanOrEqualTo(@150);
        make.height.greaterThanOrEqualTo(@40);
    }];
    //_redeemedLabel.font = [UIFont fontWithName:@"Raleway-Medium" size:35];
    _redeemedLabel.font = [UIFont fontWithName:@"Raleway-Medium" size:35];
    _redeemedLabel.textColor = [UIColor colorWithWhite:1.0 alpha:1];
    
    //[_redeemedText removeConstraints:_redeemedText.constraints];
    [self.redeemedText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.redeemedView.mas_centerX);
        make.centerY.equalTo(self.remainingText.mas_centerY);
        make.width.greaterThanOrEqualTo(@142);
        make.height.greaterThanOrEqualTo(@21);
    }];
    //_redeemedText.font = [UIFont fontWithName:@"Raleway" size:17];
    _redeemedText.font = [UIFont fontWithName:@"Raleway" size:17];
    _redeemedText.textColor = [UIColor colorWithWhite:1 alpha:1];
    
    //[_pointEntries removeConstraints:_pointEntries.constraints];
    [self.pointEntries mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.redeemedView.mas_bottom);
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-45);
        make.width.equalTo(self.view.mas_width);
        //make.width.equalTo(self.view.mas_width);
    }];
    //[_pointEntries setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    if(_shadBox == nil){
    _shadBox = [[UIView alloc]initWithFrame: CGRectMake(0, 0, 0, 0)];
    [self.view addSubview:_shadBox];
    _shadBox.layer.backgroundColor = [UIColor whiteColor].CGColor;
    [_shadBox mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.greaterThanOrEqualTo(self.view.mas_width);
        make.bottom.equalTo(self.remainingView.mas_bottom);
    }];
    _shadBox.layer.masksToBounds = NO;
    _shadBox.layer.shadowColor = [UIColor blackColor].CGColor;
    _shadBox.layer.shadowOpacity = 1;
    _shadBox.layer.shadowOffset = CGSizeMake(0, 0);
    _shadBox.layer.shadowRadius = 4;
    }
        
    [self.view bringSubviewToFront:self.redeemedView];
    [self.view bringSubviewToFront:self.remainingView];
    
    UIView *topBar =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self.view addSubview: topBar];
    [topBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.remainingView.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.width.greaterThanOrEqualTo(self.view.mas_width);
    }];
    topBar.layer.masksToBounds = NO;
    topBar.layer.shadowOffset = CGSizeMake(0, 0);
    topBar.backgroundColor = [UIColor whiteColor];
    topBar.layer.shadowColor = [UIColor blackColor].CGColor;
    topBar.layer.shadowRadius = 2;
    topBar.layer.shadowOpacity = 1;
    [self.view bringSubviewToFront:topBar];

    [self.view bringSubviewToFront:_remainingLabel];
    //_pointEntries = [[UITableView alloc]init];
    //_pointEntries.delegate = self;
    //_pointEntries.dataSource = self;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"Checking: %ld", [[PointEntry allObjects] count]);
    return [[PointEntry allObjects] count];
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier= @"SimpleTableCell";
    
    PointEntryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[PointEntryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        }
    
    cell.traits = [[[PointEntry allObjects] sortedResultsUsingProperty:@"date" ascending:NO] objectAtIndex: indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
@end
