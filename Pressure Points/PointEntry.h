//
//  PointEntry.h
//  Pressure Points
//
//  Created by Carlos  Guanche on 8/5/15.
//  Copyright © 2015 Carlos  Guanche. All rights reserved.
//

#import "RLMObject.h"

@interface PointEntry : RLMObject

@property NSInteger amount;
@property NSDate *date;
@property BOOL isExpired;
@property BOOL isSubt;

@end
RLM_ARRAY_TYPE(PointEntry)