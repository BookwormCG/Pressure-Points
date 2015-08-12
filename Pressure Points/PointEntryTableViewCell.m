//
//  PointEntryTableViewCell.m
//  Pressure Points
//
//  Created by Carlos  Guanche on 7/15/15.
//  Copyright © 2015 Carlos  Guanche. All rights reserved.
//


#import "PointEntryTableViewCell.h"
#import "DataManager.h"
#import "Masonry.h"
#import "MPColorTools.h"

@interface PointEntryTableViewCell ()

@property (nonatomic, strong) IBOutlet UILabel *timeCreated;

@property (nonatomic, strong) IBOutlet UILabel *timeRemaining;

@property (nonatomic, strong) IBOutlet UILabel *amountReceived;

@property (nonatomic, strong) UIView *ranking;

@end

@implementation PointEntryTableViewCell



- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        
        _timeCreated = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        [self.contentView addSubview:_timeCreated];
        [self.timeCreated mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.centerY.equalTo(self.contentView.mas_centerY).with.offset(-10);
            //make.bottom.equalTo(self.view.mas_bottom).with.offset(-10);
            make.width.greaterThanOrEqualTo(@75);
        }];
        _timeCreated.font = [UIFont fontWithName:@"Raleway" size:17];
        //_timeCreated.font = [UIFont fontWithName:@"Raleway-Regular" size:17];
        
        _timeRemaining = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 100, 40)];
        [self.contentView addSubview:_timeRemaining];
        [self.timeRemaining mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(self.timeCreated.mas_left);
            make.centerY.equalTo(self.contentView.mas_centerY).with.offset(20);
            make.width.greaterThanOrEqualTo(@50);
        }];
        _timeRemaining.font = [UIFont fontWithName:@"Raleway-SemiBold" size:17];
        _timeRemaining.layer.opacity = 0.5;
            
        _amountReceived = [[UILabel alloc] initWithFrame:CGRectMake(0,0,100,40)] ;
            [self.contentView addSubview:_amountReceived];
            [self.amountReceived mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.contentView.mas_right).with.offset(-20);
                //make.left.equalTo(self.mas_left).with.offset(180);
                make.centerY.equalTo(self.contentView.mas_centerY);
                make.top.equalTo(self.contentView.mas_top).with.offset(10);
                make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-10);
                make.width.greaterThanOrEqualTo(@60);
            }];
        _amountReceived.textAlignment = NSTextAlignmentCenter;
        //_amountReceived.font = [UIFont fontWithName:@"Raleway-Regular" size:17];
        
        _amountReceived.font = [UIFont fontWithName:@"Raleway-SemiBold" size:17];
        
        _ranking = [[UIView alloc] init];
        [self.contentView addSubview:_ranking];
        [self.ranking mas_makeConstraints:^(MASConstraintMaker *make) {
            /*make.left.equalTo(self.mas_left).with.offset(15);
             make.centerY.equalTo(self.mas_centerY);
             make.width.equalTo(@13);
             make.height.equalTo(@13);*/
            make.edges.equalTo(self.amountReceived);
        }];
        _ranking.layer.opacity = 0.4;
        
        [self.contentView bringSubviewToFront:_amountReceived];
    }
    return self;
}

- (void)setTraits:(PointEntry *)traits
{

            
    _traits = traits;
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
            
    format.dateStyle = NSDateFormatterShortStyle;
    format.timeStyle = NSDateFormatterShortStyle;
    
    NSString *temp = [format stringFromDate:_traits.date];
    
    _timeCreated.text = temp;
            
    if(!traits.isSubt)
    {
        //NSLog(@"Calling shouldExp from Cell with value %ld", traits.amount);
        [DataManager entryShouldExpire:traits];
                

        self.ranking.contentMode = UIViewContentModeScaleAspectFill;
        self.ranking.clipsToBounds = YES;
        self.ranking.layer.cornerRadius = 15;
        if(traits.amount <= 10){
            [self.ranking setBackgroundColor: MP_HSL(0.08611111, 0.99, 0.23)];
        }else if(traits.amount <=100){
            [self.ranking setBackgroundColor:MP_HSL(0.21, 0, 0.74)];
        }else{
            [self.ranking setBackgroundColor:MP_HSL(0.1389, 0.99, 0.55)];
        }
        
        if(!traits.isExpired)
            {
                    
                    
                NSDate *initDate = traits.date;

                NSDate *expDate = [NSDate dateWithTimeInterval:fourMo sinceDate: initDate];

                NSTimeInterval remaining = [expDate timeIntervalSinceNow];
            
                    //NSTimeInterval remaining = [[NSDate date] timeIntervalSinceDate:[NSDate dateWithTimeInterval:-120 sinceDate:[format dateFromString:[traits objectForKey:@"date"]]]];
                    /****************/
                _timeRemaining.text = [NSString stringWithFormat:@"Days: %d", (int)(remaining)];
                    /****************/
            }
            else{
                _timeRemaining.text = @"Expired!";
            }
        }
        else{
            _timeRemaining.text = @"Redemption";
            [_ranking setBackgroundColor:[UIColor clearColor]];
            //[_timeCreated mas_updateConstraints:^(MASConstraintMaker *make) {
            //  make.left.equalTo(self.mas_left).with.offset(10);
            //}];
        }
            
    _amountReceived.text = [NSString stringWithFormat:@"%ld", traits.amount];
              //[self bringSubviewToFront:_ranking];
}
         
         - (void)setSelected:(BOOL)selected animated:(BOOL)animated {
             [super setSelected:selected animated:animated];
             
             // Configure the view for the selected state
         }
         
         @end
         
