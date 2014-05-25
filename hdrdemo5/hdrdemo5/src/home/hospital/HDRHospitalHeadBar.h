//
//  HDRHospitalHeadBar.h
//  hdrdemo5
//
//  Created by apple on 14-5-25.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HospitalSearchDelegate

@optional

-(void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope;

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;

-(void)rebackTableData;// 恢复默认的表格数据显示

@end

@interface HDRHospitalHeadBar : UIView<UISearchBarDelegate>

@property (nonatomic, assign)id<HospitalSearchDelegate> delegate;

@property (nonatomic, strong)UISearchBar * searchbar;

@property (nonatomic, strong)UILabel * crtPosition;

@end
