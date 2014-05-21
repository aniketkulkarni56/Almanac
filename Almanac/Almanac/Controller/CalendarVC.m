//
//  CalendarVC.m
//  Almanac
//
//  Created by Aniket K on 5/7/14.
//  Copyright (c) 2014 AniketHub. All rights reserved.
//

#import "CalendarVC.h"

@interface CalendarVC ()

@end

@implementation CalendarVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [self initUI];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)initUI {
    
    CalendarLayout *layout = [[CalendarLayout  alloc]init];
    
    CGRect frameSelf = self.view.frame;
    frameSelf.origin.y = 40;
    frameSelf.size.height -= 40;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:frameSelf collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
//    self.collectionView.backgroundView = nil;
    [self.collectionView registerClass:[CalendarCell class] forCellWithReuseIdentifier:@"CalendarCell"];
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    
    [self.view addSubview:self.collectionView];
    
    

}

#pragma mark - Collection View Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    NSInteger iDays = [CalculationFactory numberOfDaysInMonth:section];
    
    return iDays;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return [CalculationFactory numberOfMonthsForYears:kNUM_OF_YEARS];

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDateComponents *dateComp = [CalculationFactory dateComponentsAtIndexPath:indexPath];
    
    CalendarCell *calCell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"CalendarCell" forIndexPath:indexPath];
    calCell.lblWeekday.text = [CalculationFactory weekdayFromNumber:dateComp.weekday];
    calCell.lblDate.text = [NSString stringWithFormat:@"%ld",dateComp.day];
    
//    NSLog(@"%ld) Date : %@ and Day : %@",(long)dateComp.year,calCell.lblDate.text,calCell.lblWeekday.text);
    
    return calCell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
