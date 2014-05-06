//
//  HDRDrugTableViewCtrl.h
//  hdrdemo3
//
//  Created by wei sm on 14-5-7.
//  Copyright (c) 2014年 bf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HDRDrugTableViewCtrl : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate> {
    
}

- (id)initWithSectionIndexes:(BOOL)showSectionIndexes;

- (void)scrollTableViewToSearchBarAnimated:(BOOL)animated; // Implemented by the subclasses

@property(nonatomic, assign) BOOL showSectionIndexes;

@property(nonatomic, strong, readonly) UITableView *tableView;
@property(nonatomic, strong, readonly) UISearchBar *searchBar;

@end