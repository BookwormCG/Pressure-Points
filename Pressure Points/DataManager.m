//
//  DataManager.m
//  Pressure Points
//
//  Created by Carlos  Guanche on 7/14/15.
//  Copyright © 2015 Carlos  Guanche. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager


/*
+ (NSMutableArray*)getEntriesArray
{
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"entries"] != nil)
    {
        return [NSJSONSerialization JSONObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"entries"] options:NSJSONReadingMutableContainers error:nil];
    }
    else return nil;
}


+(NSMutableDictionary*)generateAdditionEntryWithDate:(NSNumber*)date andExpiration:(BOOL)expired andValue:(NSString*)added;
{
    NSNumber *value = [NSNumber numberWithInteger:[added integerValue]];

    NSMutableDictionary *newEntry = [NSMutableDictionary dictionaryWithObjectsAndKeys:date, @"date", [NSNumber numberWithBool:NO], @"isExpired", value, @"amount", nil];
    
    [newEntry setObject:value forKey:@"amount"];
    
    NSMutableArray *entries = [DataManager getEntriesArray];
    [entries insertObject:newEntry atIndex:0];
    
    NSData *json = [NSJSONSerialization dataWithJSONObject:entries options:NSJSONWritingPrettyPrinted error:nil];
    
    [[NSUserDefaults standardUserDefaults] setObject:json forKey:@"entries"];
    
    return newEntry;
}

+ (NSMutableDictionary*)generateSubtractionEntryWithDate :(NSNumber*)date andValue:(NSString*)subtracted
{
    
    NSNumber *value = [NSNumber numberWithInteger:[subtracted integerValue]];
    
    NSMutableDictionary *newEntry = [NSMutableDictionary dictionaryWithObjectsAndKeys:date, @"date", value, @"amount", nil];
    
    NSMutableArray *entries = [DataManager getEntriesArray];
    [entries insertObject:newEntry atIndex:0];
    
    NSData *json = [NSJSONSerialization dataWithJSONObject:entries options:NSJSONWritingPrettyPrinted error:nil];
    
    [[NSUserDefaults standardUserDefaults] setObject:json forKey:@"entries"];
    
    return newEntry;
}


+ (BOOL)entryIsExpired:(PointEntry*)entry
{
    NSLog(@"it is %d", entry.isExpired);
    if (entry.isExpired) {
        return YES;
    }
    else return NO;
}*/

+ (BOOL)entryShouldExpire :(PointEntry*)entry
{
    
    //NSLog(@"following %ld", entry.amount);
    
    if(entry.isSubt || entry.isExpired)
    {
        //NSLog(@"either subt or exp'd");
        return NO;
    }
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    format.dateStyle = NSDateFormatterShortStyle;
    format.timeStyle = NSDateFormatterShortStyle;
    
    NSDate *instDay = entry.date;
    
    NSDate *termiDate = [NSDate dateWithTimeInterval: fourMo sinceDate: instDay];
    
    NSDate *now = [NSDate date];
    
    if([now isEqualToDate:termiDate]  || ([now isEqualToDate:[termiDate laterDate:now]]))
    {
        //NSLog(@"Calling expirePoints");
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        
        [realm beginWriteTransaction];
        entry.isExpired = YES;
        [realm commitWriteTransaction];
        
        [DataManager expirePoints: (int)entry.amount];
        
        return YES;
    }
    else {
        //NSLog(@"MadeIt");
        return NO;
    }
     
}

+ (void)expirePoints :(int)expired
{
    int buffer = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"rNotE"];
    int remaining = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"remainingPoints"];
    
    if (expired > buffer) {
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"rNotE"];
        [[NSUserDefaults standardUserDefaults] setInteger:(remaining-(expired-buffer)) forKey:@"remainingPoints"];
        //[[NSUserDefaults standardUserDefaults] setInteger: (expired-buffer) forKey:@"pointsWasted"];
    }else{
        [[NSUserDefaults standardUserDefaults] setInteger:(buffer-expired) forKey:@"rNotE"];
    }
}


@end
