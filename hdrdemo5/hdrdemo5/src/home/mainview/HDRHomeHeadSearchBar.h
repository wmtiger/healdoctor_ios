//
//  HDRHomeHeadSearchBar.h
//  hdrdemo5
//
//  Created by apple on 14-5-18.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HDRHomeSearchDelegate

@required

- (void)toShowHospital;

- (void)toShowDrug;

- (void)toShowDrugStore;

@optional

- (void) showSelectCityView;
- (void) showSelectTypeView;

@end

@interface HDRHomeHeadSearchBar : UIView <UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar * searchbar;

@property (nonatomic, strong) UIButton * cityBtn;

@property (nonatomic, strong) UIButton * typeBtn;

@property (nonatomic, strong) id<HDRHomeSearchDelegate> delegate;

- (void)setCityBtnName:(NSString *)cityName;
- (void)setTypeBtnName:(NSString *)typeName;

- (void)setTypeIsHospital;

- (void)setTypeIsDrug;

- (void)setTypeIsDrugStore;

@end
