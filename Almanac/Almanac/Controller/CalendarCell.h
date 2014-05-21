//
//  CalendarCell.h
//  Almanac
//
//  Created by Aniket K on 5/8/14.
//  Copyright (c) 2014 AniketHub. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarCell : UICollectionViewCell

@property (nonatomic,strong) UILabel *lblWeekday;
@property (nonatomic,strong) UILabel *lblDate;
@property (nonatomic,strong) UIImageView *imgSeparatorH;

@end
