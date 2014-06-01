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
        
        UIImageView * bg = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"bg_navbar"]];
        bg.frame = CGRectMake(0, 0, 320, 60);
        [self addSubview:bg];
        
        _cityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cityBtn.frame = CGRectMake(0, 0, 50, 60);
        _cityBtn.backgroundColor = [UIColor clearColor];
        [self setCityBtnName:@"杭州"];
        
        [_cityBtn addTarget:self action:@selector(clickCity:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_cityBtn];
        
        UIImageView * spbg = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"bg_sp"]];
        [self addSubview:spbg];
        [spbg setFrame:CGRectMake(51, 20, spbg.frame.size.width, 20)];
        
        _typeBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
        _typeBtn.frame = CGRectMake(54, 0, 50, 60);
        [self setTypeIsHospital];
        
        [_typeBtn addTarget:self action:@selector(clickType:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_typeBtn];
        
        self.searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(100, 0, 220, 60)];
        self.searchbar.keyboardType = UIKeyboardTypeDefault;
//        self.searchbar.delegate = self;
        [(UIView *)[self.searchbar.subviews objectAtIndex:0] removeFromSuperview];
        [self addSubview:self.searchbar];
        
        _searchbar.placeholder = @"点此搜索";
        
        UIButton * searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        searchBtn.frame = CGRectMake(100, 0, 220, 60);
        searchBtn.backgroundColor = [UIColor clearColor];
//        [self setCityBtnName:@"杭州"];
        [searchBtn addTarget:self action:@selector(clickSearchBar:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:searchBtn];
    }
    return self;
}

- (void)setCityBtnName:(NSString *)cityName
{
    [_cityBtn setTitle:cityName forState:UIControlStateNormal];
}

- (void)setTypeBtnName:(NSString *)typeName
{
    [_typeBtn setTitle:typeName forState:UIControlStateNormal];
}

- (void)setTypeIsHospital
{
    [self setTypeBtnName:@"医院"];
}

- (void)setTypeIsDrug
{
    [self setTypeBtnName:@"药品"];
}

- (void)setTypeIsDrugStore
{
    [self setTypeBtnName:@"药店"];
}

- (void)clickCity:(id)sender
{
//    NSLog(@"click city");
    [_delegate showSelectCityView];
}

- (void)clickType:(id)sender
{
//    NSLog(@"click type");
    [_delegate showSelectTypeView];
}

- (void)clickSearchBar:(id)sender
{
    NSLog(@"clickSearchBar");
    NSLog(@"_typeBtn.titleLabel.text:%@", _typeBtn.titleLabel.text);
//    NSLog(@"%c", [_typeBtn.titleLabel.text isEqualToString:@"医院"]);
    if ([_typeBtn.titleLabel.text isEqualToString:@"医院"]) {
        [_delegate toShowHospital];
    }
    else if ([_typeBtn.titleLabel.text isEqualToString:@"药品"])
    {
        [_delegate toShowDrug];
    }
    else if ([_typeBtn.titleLabel.text isEqualToString:@"药店"])
    {
        [_delegate toShowDrugStore];
    }
}


#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar;
{
    
//    [HDRGlobalData instance];
//    [self.searchbar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
//    [self.searchbar resignFirstResponder];
//    [self.searchbar setShowsCancelButton:NO animated:YES];
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
