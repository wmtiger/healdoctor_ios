//
//  HDRSelectCityTableViewCtrl.h
//  hdrdemo5
//
//  Created by wei sm on 14-6-1.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectCityDelegate <NSObject>

@optional

- (void) selectedCityName:(NSString *) name;

@end

@interface HDRSelectCityTableViewCtrl : UITableViewController <UISearchBarDelegate>

@property (nonatomic, strong) NSDictionary *cities;
@property (nonatomic, strong) NSMutableArray *keys;

@property (nonatomic, strong) UIView * headView;

@property (nonatomic, strong) id <SelectCityDelegate> selectDelegate;

@end
