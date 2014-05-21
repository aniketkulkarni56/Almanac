//
//  CalendarCell.m
//  Almanac
//
//  Created by Aniket K on 5/8/14.
//  Copyright (c) 2014 AniketHub. All rights reserved.
//

#import "CalendarCell.h"


@implementation CalendarCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.lblWeekday = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, kHEIGHT_WEEKDAY)];
        [self.lblWeekday setFont:[UIFont boldSystemFontOfSize:14.f]];
        [self.lblWeekday setBackgroundColor:[UIColor clearColor]];
        [self.lblWeekday setTextColor:[UIColor blackColor]];
        [self.lblWeekday setTextAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:self.lblWeekday];

        self.imgSeparatorH = [[UIImageView alloc]initWithFrame:CGRectMake(0,self.lblWeekday.frame.size.height,self.frame.size.width,kHEIGHT_SEPARATOR_H)];
        [self.imgSeparatorH setBackgroundColor:[UIColor blackColor]];
        [self.contentView addSubview:self.imgSeparatorH];
        
        self.lblDate = [[UILabel alloc] initWithFrame:CGRectMake(0, self.imgSeparatorH.frame.origin.y, self.frame.size.width, self.frame.size.height-self.imgSeparatorH.frame.origin.y)];
        [self.lblDate setFont:[UIFont systemFontOfSize:14.f]];
        [self.lblDate setBackgroundColor:[UIColor clearColor]];
        [self.lblDate setTextColor:[UIColor blackColor]];
        [self.lblDate setTextAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:self.lblDate];
        
    }
    
    
    return self;
}


- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    
    [super applyLayoutAttributes:layoutAttributes];


}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
