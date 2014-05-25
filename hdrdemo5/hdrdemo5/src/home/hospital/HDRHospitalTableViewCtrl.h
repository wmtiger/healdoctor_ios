//
//  HDRHospitalTableViewCtrl.h
//  hdrdemo5
//
//  Created by apple on 14-5-24.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDRHospitalHeadBar.h"

@interface HDRHospitalTableViewCtrl : UITableViewController<UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar * searchbar;
@property (nonatomic, strong) UISegmentedControl * segCtrl;
@property (nonatomic, strong) UIView * segView;

@property (nonatomic, strong) NSMutableArray * crtSelectData;// 当前选择的要查询的数据源

@property (nonatomic, strong) NSMutableArray * hospitalData;
@property (nonatomic, strong) NSMutableArray * drugStoreData;
@property (nonatomic, strong) NSMutableArray * drugData;

@property (nonatomic, strong) NSMutableArray * searchResultData;// 被查询后的数据源

@end
