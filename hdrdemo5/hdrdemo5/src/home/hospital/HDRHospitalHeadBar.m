//
//  HDRHospitalHeadBar.m
//  hdrdemo5
//
//  Created by apple on 14-5-25.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HDRHospitalHeadBar.h"

@implementation HDRHospitalHeadBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
        NSArray * titles = [[NSArray alloc]initWithObjects:@"医院", @"药店", @"药品", nil];
        self.searchbar.scopeButtonTitles =titles;
        self.searchbar.showsScopeBar = YES;
        self.searchbar.delegate = self;
        [self addSubview:_searchbar];
        _searchbar.selectedScopeButtonIndex = 0;

        _crtPosition = [[UILabel alloc] initWithFrame:CGRectMake(0, _searchbar.frame.size.height, 320, self.frame.size.height - _searchbar.frame.size.height)];
        [self addSubview:_crtPosition];
    }
    return self;
}

#pragma mark - searchbar delegate

-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    [self.searchbar setShowsCancelButton:YES animated:YES];
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [self.searchbar setShowsCancelButton:NO animated:YES];
    [self.searchbar resignFirstResponder];
    _searchbar.text = @"";
    [_delegate rebackTableData];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"txt change %@", searchText);
    [_delegate searchBar:searchBar textDidChange:searchText];
}

-(void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    NSLog(@"select idx:%d", selectedScope);
    [_delegate searchBar:searchBar selectedScopeButtonIndexDidChange:selectedScope];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
