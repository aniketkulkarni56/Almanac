//
//  CalendarLayout.h
//  Almanac
//
//  Created by Aniket K on 5/8/14.
//  Copyright (c) 2014 AniketHub. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarLayout : UICollectionViewLayout

@property (nonatomic) CGSize daySize;
@property (nonatomic,strong) NSMutableDictionary *dicLayoutAttributes;
@property (nonatomic) CGFloat iSpaceBetweenDays;
@property (nonatomic) CGFloat iSpaceBetweenMonths;

@end
