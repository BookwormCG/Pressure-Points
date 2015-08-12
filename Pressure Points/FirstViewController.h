//
//  FirstViewController.h
//  Pressure Points
//
//  Created by Carlos  Guanche on 7/7/15.
//  Copyright (c) 2015 Carlos  Guanche. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#import "LoginViewController.h"

@import Foundation;


@interface FirstViewController : UIViewController <AVCaptureMetadataOutputObjectsDelegate>


@property (weak, nonatomic) IBOutlet UIView *mainView;
//@property (weak, nonatomic) IBOutlet UILabel *have;
//@property (weak, nonatomic) IBOutlet UILabel *dollars;
@property (weak, nonatomic) IBOutlet UILabel *mainPoints;
//@property (weak, nonatomic) IBOutlet UILabel *connect;
@property (strong, nonatomic) IBOutlet UILabel *subPoints;
//@property (weak, nonatomic) IBOutlet UILabel *connect2;
@property (weak, nonatomic) IBOutlet UILabel *days;
//@property (weak, nonatomic) IBOutlet UILabel *time;

@property (strong, nonatomic) UIView *qrScanner;
@property (strong, nonatomic) UIView *frameWork;
@property (nonatomic, strong) AVCaptureSession *mainReader;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;


- (void)didLog;
- (void)updateLabels;

@end

