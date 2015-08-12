//
//  PointEntryTableViewCell.h
//  Pressure Points
//
//  Created by Carlos  Guanche on 7/15/15.
//  Copyright © 2015 Carlos  Guanche. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Realm/Realm.h"
#import "PointEntry.h"

@interface PointEntryTableViewCell : UITableViewCell

@property (strong, nonatomic) PointEntry *traits;

@end

