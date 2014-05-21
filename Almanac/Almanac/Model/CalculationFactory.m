//
//  CalculationFactory.m
//  Almanac
//
//  Created by Aniket K on 5/9/14.
//  Copyright (c) 2014 AniketHub. All rights reserved.
//

#import "CalculationFactory.h"

@implementation CalculationFactory

+ (NSInteger)numberOfMonthsForYears:(NSInteger)years {
    
    return years * kMONTHS_IN_A_YEAR;

}

+ (NSInteger)numberOfDaysInMonth:(NSInteger)section {
    
    NSDateComponents *dateCompMonth = [CalculationFactory dateComponentsOfSection:section];
    
    NSRange days = [[CalculationFactory gregorianCalendar] rangeOfUnit:NSDayCalendarUnit
                           inUnit:NSMonthCalendarUnit
                          forDate:[dateCompMonth date]];

    NSLog(@"%ld) Year : %ld, Month: %ld, days :%ld \n",section,dateCompMonth.year,dateCompMonth.month,days.length);

    return days.length;
    
}

+ (NSDateComponents *)dateComponentsOfSection:(NSInteger)section {

    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setCalendar:[CalculationFactory gregorianCalendar]];
    [dateComponents setMonth:section];
    
    NSDate *dateSection = [[CalculationFactory gregorianCalendar] dateByAddingComponents:dateComponents toDate:[NSDate date] options:0];
    
    return [CalculationFactory dateComponentsOfDate:dateSection];
    
}

+ (NSDateComponents *)dateComponentsOfDate:(NSDate *)date {
    
    NSCalendar *currentCalendar= [CalculationFactory gregorianCalendar];
    
    NSCalendarUnit units = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |NSWeekdayCalendarUnit;
    
    NSDateComponents *components = [currentCalendar components:units
                                                        fromDate:date];
    [components setCalendar:currentCalendar];

    return components;
    
}

+ (NSDateComponents *)currentDateComponents {
    
    return [CalculationFactory dateComponentsOfDate:[NSDate date]];

}

+ (NSInteger)monthOfSection:(NSInteger)section {

    NSInteger iMonthForSectionZero = [[CalculationFactory currentDateComponents] month];
    
    NSInteger iAdjustor = iMonthForSectionZero;
    
    NSInteger iYear = section % 12;
    
    return iYear;

}


+ (NSDateComponents *)dateComponentsAtIndexPath:(NSIndexPath *)indexPath {

//    NSDate *dateNow = [NSDate date];
//    NSDate *dateAtiPath = nil;
//    
//    if ( indexPath.section == 0 ) {
//        
////        NSDateComponents *dateComponentsToday = [CalculationFactory dateComponentsOfDate:dateNow];
//        
//        NSDateComponents *componentsToAdd = [[NSDateComponents alloc]init];
//        [componentsToAdd setDay:indexPath.row];
//        [componentsToAdd setCalendar:[CalculationFactory gregorianCalendar]];
//        
//        dateAtiPath = [[CalculationFactory gregorianCalendar] dateByAddingComponents:componentsToAdd toDate:dateNow options:0];
//
//    } else {
//        
//        NSInteger day = indexPath.row+1;
//        NSInteger month = [CalculationFactory monthOfSection:indexPath.section];
//        
//        
//    }
//
//    [[CalculationFactory gregorianCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |NSWeekdayCalendarUnit fromDate:dateAtiPath];
    
    NSDateComponents *dateComponents = [CalculationFactory dateComponentsOfSection:indexPath.section];
    [dateComponents setDay:indexPath.row];
    [dateComponents setCalendar:[CalculationFactory gregorianCalendar]];

    NSDate *dateSection = [[CalculationFactory gregorianCalendar] dateByAddingComponents:dateComponents toDate:[NSDate date] options:0];
    
    NSDateComponents *dateComp = [CalculationFactory dateComponentsOfDate:dateSection];
    
//    NSLog(@"S: %ld, R: %ld \n > Date: %ld Month: %ld, Year: %ld, \n",
//          indexPath.section,indexPath.row,dateComp.day,dateComp.month,dateComp.year);
    
    
    
    return dateComp;
    
}

+ (NSString *)weekdayFromNumber:(NSInteger)iDayIndex {
    
    NSArray *arrWeekdays = @[@"SUN",@"MON",@"TUE",@"WED",@"THU",@"FRI",@"SAT"];
    
    NSString *strWDay = arrWeekdays [iDayIndex-1];
    return strWDay;
    
}

#pragma mark - COMMON
+ (NSCalendar *)gregorianCalendar {
    
    NSCalendar *calGreg = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    return calGreg;
    
    
}

+ (NSArray*)monthsNames {
    
    NSArray *arrMonthsNames = nil;
    
    if (!arrMonthsNames) {
        
        NSDateFormatter * df = [[NSDateFormatter alloc] init];
        [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:[[NSLocale preferredLanguages] objectAtIndex:0]]];
        
        arrMonthsNames = [df monthSymbols];
        
    }
    
    return arrMonthsNames;
    
}

@end
