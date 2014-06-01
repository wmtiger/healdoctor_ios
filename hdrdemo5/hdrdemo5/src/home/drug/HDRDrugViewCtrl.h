//
//  HDRDrugViewCtrl.h
//  hdrdemo5
//
//  Created by wei sm on 14-5-22.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HDRDrugViewCtrl : UITableViewController<UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar * searchbar;
@property (nonatomic, strong) UISegmentedControl * segCtrl;
@property (nonatomic, strong) UIView * segView;

@property (nonatomic, strong) NSMutableArray * crtSelectData;// 当前选择的要查询的数据源

@property (nonatomic, strong) NSMutableArray * searchResultData;// 被查询后的数据源

-(void)setSegCtrlData:(NSInteger)idx;
- (void) selectCrtSegIndex:(NSInteger)idx;

- (void)addSearchBar;// 把搜索栏加到顶部

@end
