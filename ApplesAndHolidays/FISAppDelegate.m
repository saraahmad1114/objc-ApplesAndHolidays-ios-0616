//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

/**
 
 * Implement your methods here.
 
 */

-(NSArray*)pickApplesFromFruits:(NSArray*)fruits {

    NSPredicate *appleCheckOccurencesPredicate =
    [NSPredicate predicateWithFormat:@"self MATCHES 'apple'"];
    fruits = [fruits filteredArrayUsingPredicate:appleCheckOccurencesPredicate];
    return fruits;
}

-(NSArray*) holidaysInSeason:(NSString*)season inDatabase:(NSDictionary*)database{
    return [database[season] allKeys];
}
//Start here
-(NSArray*)suppliesInHoliday:(NSString*)holiday inSeason:(NSString*)season inDatabase:(NSDictionary*)database {
    NSArray *newArray;
    newArray =database [season][holiday];
    return newArray;
}

-(BOOL)holiday:(NSString*)holiday isInSeason:(NSString*)season inDatabase:(NSDictionary*)database{
    BOOL isOrNoHoliday = database[season][holiday];
    if (isOrNoHoliday)
    {
        return YES;
    }
        return NO;
}
-(BOOL)supply: (NSString*)supply isInHoliday:(NSString*)holiday inSeason:(NSString*)season inDatabase: (NSDictionary*)database{
    BOOL containsSuppliesOrNot = NO;
    if ([database[season][holiday] containsObject:supply])
    {
        return YES;
    }
    
    return containsSuppliesOrNot;
}
-(NSDictionary*)addHoliday:(NSString*)holiday toSeason:(NSString*)season inDatabase:(NSDictionary*)database{
    
    NSMutableArray *addnewstuff = [[NSMutableArray alloc] init];
    
    [database[season] setObject:addnewstuff forKey:holiday];
    
    return database;
}

-(NSDictionary*)addSupply:(NSString*)supply toHoliday:(NSString*)holiday inSeason:(NSString*)season inDatabase:(NSDictionary*)database{
    
    [database[season][holiday] addObject:supply];
    return database;
}

@end

