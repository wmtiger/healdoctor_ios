//
//  HDRHospitalViewCtrl.h
//  hdrdemo5
//
//  Created by wei sm on 14-5-22.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HDRHospitalViewCtrl : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate>

@property (nonatomic, strong)UISearchBar * searchbar;
@property (nonatomic, strong)UISearchDisplayController * searchctrl;

@end
