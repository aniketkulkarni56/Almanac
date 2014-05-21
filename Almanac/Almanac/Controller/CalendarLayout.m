//
//  CalendarLayout.m
//  Almanac
//
//  Created by Aniket K on 5/8/14.
//  Copyright (c) 2014 AniketHub. All rights reserved.
//

#import "CalendarLayout.h"

@implementation CalendarLayout
- (id)init {

    self = [super init];
    
    if ( self ) {
        
        [self setUp];
        
    }
    
    return self;
    
}

- (void)setUp {
    
    self.daySize = CGSizeMake(kWIDTH_DAY_CELL, kHEIGHT_DAY_CELL);
    self.iSpaceBetweenDays = kSEPARATOR_BETWEEN_DAYS_V;
    self.iSpaceBetweenMonths = kSEPARATOR_BETWEEN_MONTHS_H;
    
}

- (void)prepareLayout {
    
    NSInteger iMonths = self.collectionView.numberOfSections;
    
    self.dicLayoutAttributes = [NSMutableDictionary dictionary];
    
    for (int i = 0; i < iMonths; i++) {
        
        NSInteger iDaysInMonth = [self.collectionView numberOfItemsInSection:i];
        
        for (int iD = 0; iD < iDaysInMonth; iD++) {
            
            NSIndexPath *iPathForDay = [NSIndexPath indexPathForRow:iD inSection:i];
            
            UICollectionViewLayoutAttributes *layoutDay =
            [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:iPathForDay];
            layoutDay.frame = [self frameForDayAtIndexPath:iPathForDay];
            ;
            
            self.dicLayoutAttributes[iPathForDay] = layoutDay;
            
        }
        
        
    }
    
    [super prepareLayout];

}

- (CGRect)frameForDayAtIndexPath:(NSIndexPath *)iPathForDay {

    CGRect frameDay = CGRectZero;
    frameDay.size = self.daySize;
    
    frameDay.origin.y = (self.daySize.height+self.iSpaceBetweenMonths) * iPathForDay.section;
    frameDay.origin.x = (self.daySize.width+self.iSpaceBetweenDays) * iPathForDay.row;
    
    return frameDay;

}

- (CGSize)collectionViewContentSize {

    return CGSizeMake(kMAX_NUM_OF_DAYS_IN_MONTH * (kWIDTH_DAY_CELL),self.collectionView.numberOfSections * (self.daySize.height ) + (self.collectionView.numberOfSections-1) * self.iSpaceBetweenMonths);
    
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {


    NSMutableArray *arrDaysInRect = [NSMutableArray array];
    
    [self.dicLayoutAttributes enumerateKeysAndObjectsUsingBlock:^(NSIndexPath *iDayIndex, UICollectionViewLayoutAttributes *attributeForDay, BOOL *stop) {
        
        
        if ( CGRectIntersectsRect([attributeForDay frame],rect)) {
            
            [arrDaysInRect addObject:attributeForDay];
        }
    
        
        
    }];
    
    
    
    return arrDaysInRect;
    
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *attributes = self.dicLayoutAttributes[indexPath];
    
//    NSLog(@"Index path : %@ \n",indexPath);
    return attributes;
    
}

@end
