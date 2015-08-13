//
//  FirstViewController.m
//  Pressure Points
//
//  Created by Carlos  Guanche on 7/7/15.
//  Copyright (c) 2015 Carlos  Guanche. All rights reserved.
//

#import "FirstViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "Masonry.h"
#import "DataManager.h"
#import "Realm/Realm.h"
#import "PointEntry.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

#pragma mark First View Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mainReader = nil;

    
    UIView *topBar =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self.view addSubview: topBar];
    [topBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mainView.mas_top);
        make.height.equalTo(@20);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.width.equalTo(self.view.mas_width);
    }];
    topBar.layer.masksToBounds = NO;
    topBar.layer.shadowOffset = CGSizeMake(0, 0);
    topBar.backgroundColor = [UIColor whiteColor];
    topBar.layer.shadowColor = [UIColor blackColor].CGColor;
    topBar.layer.shadowRadius = 2;
    topBar.layer.shadowOpacity = 1;

        //organize the main view
    
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        //make.bottom.equalTo(self.view.mas_bottom).with.offset(-45);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.width.equalTo(self.view.mas_width);
        make.height.equalTo(self.view.mas_height);
    }];
    
    _frameWork = [[UIView alloc]init];
    [self.view addSubview:_frameWork];
    [_frameWork mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mainView.mas_right).with.offset(-10);
        make.left.equalTo(self.mainView.mas_left).with.offset(10);
        //make.bottom.equalTo(self.view.mas_bottom).with.offset(-60);
        make.top.equalTo(topBar.mas_bottom).with.offset(10);
        make.height.equalTo(self.frameWork.mas_width);
        //make.top.equalTo(self.mainView.mas_top).with.offset(100);
    }];
    //_frameWork.backgroundColor = [UIColor redColor];
    _frameWork.backgroundColor = [UIColor blackColor];
    _frameWork.layer.cornerRadius = 30;
    _frameWork.layer.masksToBounds = NO;
    _frameWork.layer.shadowColor = [UIColor blackColor].CGColor;
    _frameWork.layer.shadowOffset = CGSizeMake(0, 0);
    _frameWork.layer.shadowOpacity = 1;
    _frameWork.layer.shadowRadius = 4;

    _qrScanner = [[UIView alloc] init];
    [self.view addSubview: _qrScanner];
    _qrScanner.layer.cornerRadius = 30;
    _qrScanner.bounds = _frameWork.bounds;
    //_qrScanner.backgroundColor = [UIColor whiteColor];
    
    UIImageView *logoView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self.view addSubview:logoView];
    //[logoView setImage:[UIImage imageNamed:@"ImprovedLogo"]];
    logoView.contentMode = UIViewContentModeScaleAspectFill;
    
    [self.view addSubview:self.mainPoints];
    [self.mainPoints mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.centerX.equalTo(self.view.mas_centerX);
        make.left.equalTo(self.view.mas_left);
        //make.top.equalTo(topBar.mas_bottom).with.offset(50);
        make.top.equalTo(self.frameWork.mas_bottom).with.offset(30);
        make.height.equalTo(@80);
        make.width.equalTo(self.view.mas_width);
    }];
    _mainPoints.font = [UIFont fontWithName:@"Raleway" size:52];
    self.mainPoints.textAlignment = NSTextAlignmentCenter;
    //self.mainPoints.textColor = self.mainView.backgroundColor;
    //self.mainPoints.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_subPoints];
    [self.subPoints mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_centerX).with.offset(15);
        make.top.equalTo(self.mainPoints.mas_bottom);
        make.width.greaterThanOrEqualTo(@90);
        make.height.equalTo(@40);
    }];
    _subPoints.font = [UIFont fontWithName:@"Raleway" size:32];
    
    [self.view addSubview:_days];
    [self.days mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_centerX).with.offset(15);
        make.centerY.equalTo(self.subPoints.mas_centerY);
        make.width.greaterThanOrEqualTo(@100);
    }];
    self.days.textAlignment = NSTextAlignmentCenter;
    _days.font = [UIFont fontWithName:@"Raleway" size:32];
    
    
    [logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mainPoints.mas_top);
        make.left.equalTo(self.subPoints.mas_left);
        make.right.equalTo(self.days.mas_right);
    }];
    
    [self.view bringSubviewToFront:topBar];
    

    [self.view bringSubviewToFront:self.mainPoints];
    
    [self updateLabels];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [self updateLabels];
    [self didLog];
    [self record];
    [super viewDidAppear:YES];

    
}

- (void)didLog
{
    if ([NSUserDefaults.standardUserDefaults integerForKey:@"PIN"] == 0) {
        
        //instantiate next view controller
        LoginViewController *logger = [[LoginViewController alloc] initWithNibName:@"LoginView" bundle:nil];
        
        //create a navController with your next view as its root
        UINavigationController *logWork = [[UINavigationController alloc] initWithRootViewController:logger];
        
        logWork.navigationBar.translucent = true;
        
        //present the Navigation Controller, not the next view you want; it will present its root view, which should be the correct view.
        [self presentViewController:logWork animated:NO completion:nil];
    }
}

-(void)updateLabels{
    
    //for days/subPoints
    
    RLMResults *arr = [PointEntry allObjects];
    PointEntry *soonest = nil;
    if(arr == nil || [arr count] == 0)
    {
        self.subPoints.text = @"Have Any";
        self.subPoints.layer.opacity = 1;
        [self.subPoints mas_updateConstraints:^(MASConstraintMaker *make) {
        //make.right.equalTo(self.mainPoints.mas_left).with.offset(100);
            make.right.equalTo(self.view.mas_centerX).with.offset(15);
        }];
    }
    else
    {
        for(int c = 0; c < [arr count]; c++)
        {
            PointEntry *entry = [arr objectAtIndex:c];
            //NSLog(@"Calling shouldExp from First with value %ld who is %d", (long)entry.amount, entry.isExpired);
            [DataManager entryShouldExpire:entry];
            if (!entry.isSubt && !entry.isExpired) {
                
                NSDateFormatter *format = [[NSDateFormatter alloc] init];
                
                format.dateStyle = NSDateFormatterShortStyle;
                format.timeStyle = NSDateFormatterShortStyle;
                
                NSDate *testInit = entry.date;
                NSDate *testExp = [[NSDate alloc] initWithTimeInterval:fourMo sinceDate:testInit];
                NSTimeInterval remainingForTest = [testExp timeIntervalSinceNow];
                
                NSDate *currInit = soonest.date;
                NSDate *currExp = [[NSDate alloc] initWithTimeInterval:fourMo sinceDate:currInit];
                NSTimeInterval remainingForCurr = [currExp timeIntervalSinceNow];
                
                if(remainingForTest < remainingForCurr || soonest == nil)
                {
                    soonest = entry;
                }
                else if (remainingForTest == remainingForCurr)
                {
                    if(entry.amount>soonest.amount)
                    {
                        soonest = entry;
                    }
                }
                
            }
        }
        if(soonest != nil){
            if(soonest.amount <= [[NSUserDefaults standardUserDefaults] integerForKey:@"remainingPoints"]){
                self.subPoints.text = [NSString stringWithFormat:@"-%ld",soonest.amount];
            }else{
                self.subPoints.text = [NSString stringWithFormat:@"-%ld", [[NSUserDefaults standardUserDefaults] integerForKey:@"remainingPoints"]];
            }
            [self.subPoints mas_updateConstraints:^(MASConstraintMaker *make) {
            //    make.right.equalTo(self.mainPoints.mas_left).with.offset(7);
                make.right.equalTo(self.view.mas_centerX).offset(-50);
            }];
            self.subPoints.layer.opacity = 0.7;
            
        }
        else{
            //NSLog(@"Soonest doesn't exist");
            self.subPoints.text = @"Have Any";
            [self.subPoints mas_updateConstraints:^(MASConstraintMaker *make) {
            //    make.right.equalTo(self.mainPoints.mas_left).with.offset(100);
                make.right.equalTo(self.view.mas_centerX).with.offset(15);
            }];
            self.subPoints.layer.opacity = 1;
        }

    }

    
    if(soonest == nil){
        self.days.text = @" Points!";
        [self.days mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_centerX).with.offset(15);
        }];
        self.days.layer.opacity = 1;
    }
    else{
        /***********/
        //NSTimeInterval interval = [[[NSDate alloc] initWithTimeInterval:fourMo sinceDate:soonest.date] timeIntervalSinceNow];
        self.days.text = [NSString stringWithFormat:@"in %d Days", (int)[[[NSDate alloc] initWithTimeInterval:fourMo sinceDate:soonest.date] timeIntervalSinceNow]];
        [self.days mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_centerX).with.offset(-50);
        }];
        self.days.layer.opacity = 0.7;
        /***********/
    }
    
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"remainingPoints"] != 0){
        self.mainPoints.text = [NSString stringWithFormat:@"%d",(int)[[NSUserDefaults standardUserDefaults] integerForKey:@"remainingPoints"]];
    }
    else{
        self.mainPoints.text = @"You Don't";
    }
}

#pragma mark Former Second View Controller

-(void)viewWillDisappear:(BOOL)animated
{
    [self.mainReader stopRunning];
    [super viewWillDisappear:YES];
}


-(BOOL)record
{
    
    NSError *err;
    
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&err];
    
    if (!input) {
        NSLog(@"%@", [err localizedDescription]);
        return NO;
    }
    
    self.mainReader = [[AVCaptureSession alloc] init];
    [self.mainReader addInput:input];
    
    AVCaptureMetadataOutput *captureMetadataOutput = [[AVCaptureMetadataOutput alloc] init];
    [self.mainReader addOutput:captureMetadataOutput];
    
    dispatch_queue_t dispatchQueue = dispatch_queue_create("myQueue", NULL);
    [captureMetadataOutput setMetadataObjectsDelegate:self queue:dispatchQueue];
    [captureMetadataOutput setMetadataObjectTypes:[NSArray arrayWithObject:AVMetadataObjectTypeQRCode]];
    
    self.videoPreviewLayer =[[AVCaptureVideoPreviewLayer alloc] initWithSession: self.mainReader];
    self.videoPreviewLayer.cornerRadius = 20;
    [self.videoPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [self.videoPreviewLayer setBounds:self.qrScanner.layer.bounds];
    [self.qrScanner.layer addSublayer:self.videoPreviewLayer];
    self.videoPreviewLayer.bounds = self.frameWork.bounds;
    self.videoPreviewLayer.frame = self.frameWork.frame;
    [self.mainReader startRunning];
    return YES;
}



-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    if (metadataObjects != nil && [metadataObjects count]>0) {
        
        AVMetadataMachineReadableCodeObject *metadataObj = [metadataObjects objectAtIndex:([metadataObjects count]-1)];
        
        if([[metadataObj type] isEqualToString:AVMetadataObjectTypeQRCode]){
            //grab string from QRCode
            NSString *dataCarrier = [metadataObj stringValue];
            
            if ([[dataCarrier substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"+"] && [[dataCarrier substringWithRange:NSMakeRange(1, 3)] isEqualToString:@"lav"]) {
                
                
                UIAlertController *popUp = [UIAlertController alertControllerWithTitle:@"You Earned More Points!" message:@"Enter the amount the client spent" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *input = [UIAlertAction actionWithTitle:@"Submit" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                    if([popUp.textFields.firstObject.text integerValue]>0){
                        UITextField *point = popUp.textFields.firstObject;
                        NSInteger additive = [point.text integerValue]/10;
                    
                        [NSUserDefaults.standardUserDefaults setInteger:((additive)+((int)[NSUserDefaults.standardUserDefaults integerForKey:@"remainingPoints"])) forKey:@"remainingPoints"];
                    
                        PointEntry *entry = [[PointEntry alloc]init];
                        entry.date = [NSDate date];
                        entry.isExpired = NO;
                        entry.amount = additive;
                        entry.isSubt = NO;
                    
                        RLMRealm *realm = [RLMRealm defaultRealm];
                        [realm beginWriteTransaction];
                        [realm addObject:entry];
                        [realm commitWriteTransaction];
                    
                        [self updateLabels];
                    }
                }];
                
                [popUp addAction:input];
                [popUp addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                    textField.placeholder = @"Amount Spent";
                    textField.keyboardType = UIKeyboardTypeDecimalPad;
                }];
                
                
                [self presentViewController:popUp animated:YES completion:nil];
                
            }else if ([[dataCarrier substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"-"] && [[dataCarrier substringWithRange:NSMakeRange(1, 3)] isEqualToString:@"lav"]){
                
                UIAlertController *subtractor = [UIAlertController alertControllerWithTitle:@"Redeem Points!" message:@"How many points are being redeemed?" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *off = [UIAlertAction actionWithTitle:@"Redeem" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                    UITextField *point = subtractor.textFields.firstObject;
                    int raw = (int)[point.text integerValue];
                    
                    int remaining = (int)[NSUserDefaults.standardUserDefaults integerForKey:@"remainingPoints"];
                    
                    if(raw <= remaining)
                    {
                        if(raw != 0){
                            
                            [NSUserDefaults.standardUserDefaults setInteger:(((int)[NSUserDefaults.standardUserDefaults integerForKey:@"remainingPoints"])-(raw)) forKey:@"remainingPoints"];
                        
                            [NSUserDefaults.standardUserDefaults setInteger:(((int)[NSUserDefaults.standardUserDefaults integerForKey:@"redeemedPoints"])+(raw)) forKey:@"redeemedPoints"];
                        
                            [NSUserDefaults.standardUserDefaults setInteger:(((int)[NSUserDefaults.standardUserDefaults integerForKey:@"rNotE"])+(raw)) forKey:@"rNotE"];
                        
                        
                            PointEntry *entry = [[PointEntry alloc] init];
                            entry.date = [NSDate date];
                            entry.amount = raw;
                            entry.isExpired = NO;
                            entry.isSubt = YES;
                        
                            RLMRealm *realm = [RLMRealm defaultRealm];
                            [realm beginWriteTransaction];
                            [realm addObject:entry];
                            [realm commitWriteTransaction];
                            
                            [self updateLabels];
                        }
                    }else
                    {
                        [self presentViewController:subtractor animated:YES completion:nil];
                        subtractor.message = @"Sorry, you can't do that!";
                    }
                }];
                
                [subtractor addAction:off];
                [subtractor addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                    textField.placeholder = @"Enter Points Redeemed";
                    textField.keyboardType = UIKeyboardTypeDecimalPad;
                }];
                
                [self presentViewController:subtractor animated:YES completion:nil];
                
            }
        }
    }
}



@end
