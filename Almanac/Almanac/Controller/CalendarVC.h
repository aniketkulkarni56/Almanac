//
//  CalendarVC.h
//  Almanac
//
//  Created by Aniket K on 5/7/14.
//  Copyright (c) 2014 AniketHub. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarCell.h"
#import "CalendarLayout.h"


@interface CalendarVC : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource> {

    

}
@property (nonatomic,strong) UICollectionView *collectionView;

@end
