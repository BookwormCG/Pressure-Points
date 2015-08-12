//
//  DataManager.h
//  Pressure Points
//
//  Created by Carlos  Guanche on 7/14/15.
//  Copyright © 2015 Carlos  Guanche. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Realm/Realm.h"
#import "PointEntry.h"

             //10368000
#define fourMo 200

@interface DataManager : NSObject
/*
+ (NSMutableArray*)getEntriesArray;

+ (NSMutableDictionary*)generateAdditionEntryWithDate :(NSNumber*)date andExpiration:(BOOL)expired andValue:(NSString*)added;

+ (NSMutableDictionary*)generateSubtractionEntryWithDate :(NSNumber*)date andValue:(NSString*)subtracted;

+ (BOOL)entryIsExpired :(PointEntry*)entry;
*/

+ (BOOL)entryShouldExpire :(PointEntry*)entry;

+ (void)expirePoints :(int)expired;

@end


