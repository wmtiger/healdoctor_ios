//
//  HDRHomeHeadSearchBar.m
//  hdrdemo5
//
//  Created by apple on 14-5-18.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HDRHomeHeadSearchBar.h"
#import "HDRGlobalData.h"

@implementation HDRHomeHeadSearchBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIButton * cityBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        cityBtn.frame = CGRectMake(0, 0, 50, 44);
        [cityBtn setTitle:@"杭州" forState:UIControlStateNormal];
        [cityBtn setTitle:@"杭州" forState:UIControlStateHighlighted];
//        cityBtn.titleLabel.text = @"杭州";
        [cityBtn addTarget:self action:@selector(clickCity:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cityBtn];
        
        UIButton * typeBtn =  [UIButton buttonWithType:UIButtonTypeSystem];
        typeBtn.frame = CGRectMake(50, 0, 50, 44);
        [typeBtn setTitle:@"医院" forState:UIControlStateNormal];
        [typeBtn setTitle:@"医院" forState:UIControlStateHighlighted];
//        typeBtn.titleLabel.text = @"医院";
        [typeBtn addTarget:self action:@selector(clickType:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:typeBtn];
        
        self.searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(100, 0, 220, 44)];
        self.searchbar.keyboardType = UIKeyboardTypeDefault;
//        self.searchbar.showsCancelButton = YES;
        self.searchbar.delegate = self;
        [self addSubview:self.searchbar];
        
    }
    return self;
}

- (void)clickCity:(id)sender
{
    NSLog(@"click city");
}

- (void)clickType:(id)sender
{
    NSLog(@"click type");
}

#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar;
{
    [HDRGlobalData instance];
    [self.searchbar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [self.searchbar resignFirstResponder];
    [self.searchbar setShowsCancelButton:NO animated:YES];
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
