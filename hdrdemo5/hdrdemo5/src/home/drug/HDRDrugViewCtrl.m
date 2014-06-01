//
//  HDRDrugViewCtrl.m
//  hdrdemo5
//
//  Created by wei sm on 14-5-22.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HDRDrugViewCtrl.h"
#import "HDRGlobalData.h"

@interface HDRDrugViewCtrl ()

@end

@implementation HDRDrugViewCtrl

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView * subv = (UIView *)[[self.navigationController.navigationBar subviews] objectAtIndex:0];
    [subv removeFromSuperview];
    UIImageView * bg = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"bg_navbar"]];
    bg.frame = CGRectMake(0, 0, 320, 44);
    [self.navigationController.navigationBar addSubview:bg];
    
    UIImageView * btnbg = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"bg_backbtn"]];
    btnbg.frame = CGRectMake(10, 0, 53, 44);
    [self.navigationController.navigationBar addSubview:btnbg];
    
    UIButton * backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 53, 44)];
    backBtn.backgroundColor = [UIColor clearColor];
    [backBtn addTarget:self action:@selector(clickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButtonItem;
    
    
    UIImageView * segbg = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"bg_navbar"]];
    segbg.frame = CGRectMake(0, 0, 320, 36);
    [self.navigationController.navigationBar addSubview:segbg];
    
    _segView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 36)];
    self.tableView.tableHeaderView = _segView;
    _segView.backgroundColor = [UIColor clearColor];
    [_segView addSubview:segbg];
    
    _segCtrl = [[UISegmentedControl alloc] initWithItems:[[NSArray alloc] initWithObjects:@"对症找药", @"常用药", nil]];
    _segCtrl.frame = CGRectMake(50, 2, 220, 30);
    _segCtrl.segmentedControlStyle = UISegmentedControlStyleBar;
    [_segView addSubview:_segCtrl];
    _segCtrl.selectedSegmentIndex = 0;
    [_segCtrl addTarget:self action:@selector(changeSegment:) forControlEvents:UIControlEventValueChanged];
}

- (void) clickBackBtn:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)dealloc
{
    [_searchbar removeFromSuperview];
}

- (void)addSearchBar
{
    
    _searchbar = [[UISearchBar alloc]initWithFrame:CGRectMake(70, 0, 250, 44)];
    [(UIView *)[_searchbar.subviews objectAtIndex:0] removeFromSuperview];
    
    [self.navigationController.navigationBar addSubview:_searchbar];
    _searchbar.delegate = self;

}

-(void)setSegCtrlData:(NSInteger)idx
{
    switch (idx) {
        case 0:
            // 读取医院数据
            _crtSelectData = [HDRGlobalData instance].hospitalData;
            break;
        case 1:
            // 读取药品数据
            _crtSelectData = [HDRGlobalData instance].drugData;
            break;
            
        default:
            break;
    }
    [self.tableView reloadData];
}

- (void) selectCrtSegIndex:(NSInteger)idx
{
    _segCtrl.selectedSegmentIndex = idx;
    [self setSegCtrlData:idx];
}

-(void)changeSegment:(id)sender
{
    int idx = _segCtrl.selectedSegmentIndex;
//    NSLog(@"%d", idx);
    [self setSegCtrlData:idx];
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
    
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"txt change %@", searchText);
}

-(void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    NSLog(@"select idx:%d", selectedScope);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    NSLog(@"aaa");
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSLog(@"bbb %d", [_crtSelectData count]);
    return [_crtSelectData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    // Configure the cell...
    NSDictionary * dict = [_crtSelectData objectAtIndex:indexPath.row];
    cell.textLabel.text = [dict objectForKey:@"name"];
    NSLog(@"ccc %@", [dict objectForKey:@"name"]);
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
