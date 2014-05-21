//
//  CalculationFactory.h
//  Almanac
//
//  Created by Aniket K on 5/9/14.
//  Copyright (c) 2014 AniketHub. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculationFactory : NSObject

+ (NSCalendar *)gregorianCalendar;

+ (NSDateComponents *)dateComponentsAtIndexPath:(NSIndexPath *)indexPath;

+ (NSInteger)numberOfMonthsForYears:(NSInteger)years;

+ (NSInteger)numberOfDaysInMonth:(NSInteger)section;

+ (NSString *)weekdayFromNumber:(NSInteger)iDayIndex;

@end
