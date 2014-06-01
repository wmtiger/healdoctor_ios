//
//  HDRSelectTypeTableViewCtrl.h
//  hdrdemo5
//
//  Created by wei sm on 14-6-1.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectTypeDelegate <NSObject>

@optional

- (void) selectedTypeName:(NSString *) name;

@end

@interface HDRSelectTypeTableViewCtrl : UITableViewController <UISearchBarDelegate>

@property (nonatomic, strong) NSMutableArray * types;

@property (nonatomic, strong) UIView * headView;

@property (nonatomic, strong) id <SelectTypeDelegate> selectDelegate;

@end
