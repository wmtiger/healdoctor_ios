//
//  HDRHomeRootCtrl.h
//  hdrdemo5
//
//  Created by apple on 14-5-18.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDRHomeFunsBar.h"
#import "HDRHomeHeadSearchBar.h"
#import "HDRSelectCityTableViewCtrl.h"
#import "HDRSelectTypeTableViewCtrl.h"

@protocol HomeRootDelegate <NSObject>

@optional

- (void) showHomeTabbar;

- (void) hideHomeTabbar;

@end


@interface HDRHomeRootCtrl : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate, HDRHomeFunsDelegate, HDRHomeSearchDelegate, SelectCityDelegate, SelectTypeDelegate>

@property (nonatomic, strong) NSMutableArray * dataList;

@property (nonatomic, strong) id<HomeRootDelegate> delegate;

@end
