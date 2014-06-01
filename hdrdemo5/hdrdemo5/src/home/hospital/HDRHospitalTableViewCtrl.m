//
//  HDRHospitalTableViewCtrl.m
//  hdrdemo5
//
//  Created by apple on 14-5-24.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HDRHospitalTableViewCtrl.h"
#import "HDRGlobalData.h"
#import "HDRHospitalInfoViewCtrl.h"
#import "HDRHospitalCell.h"
#import "HDRDrugStoreCell.h"
#import "HDRDrugCell.h"

@interface HDRHospitalTableViewCtrl ()

@end

@implementation HDRHospitalTableViewCtrl

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
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
     
//    [self.navigationController.navigationBar.backItem.backBarButtonItem setBackgroundImage:[UIImage imageNamed:@"bg_backbtn"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    
    UIImageView * segbg = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"bg_navbar"]];
    segbg.frame = CGRectMake(0, 0, 320, 36);
    [self.navigationController.navigationBar addSubview:segbg];
    
    _segView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 36)];
    self.tableView.tableHeaderView = _segView;
    _segView.backgroundColor = [UIColor clearColor];
    [_segView addSubview:segbg];
    
    _segCtrl = [[UISegmentedControl alloc] initWithItems:[[NSArray alloc] initWithObjects:@"医院", @"药店", @"药品", nil]];
    _segCtrl.frame = CGRectMake(30, 2, 260, 30);
    _segCtrl.segmentedControlStyle = UISegmentedControlStyleBar;
    
    [_segView addSubview:_segCtrl];
    _segCtrl.selectedSegmentIndex = 0;
    [_segCtrl addTarget:self action:@selector(changeSegment:) forControlEvents:UIControlEventValueChanged];
//    [_segCtrl setAlpha:0];
    
}

- (void) clickBackBtn:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
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

-(void)viewWillAppear:(BOOL)animated
{
    [_searchbar setHidden:NO];
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [_searchbar setHidden:YES];
    [super viewWillDisappear:animated];
}

-(void)setSegCtrlData:(NSInteger)idx
{
    switch (idx) {
        case 0:
            // 读取医院数据
            _crtSelectData = [HDRGlobalData instance].hospitalData;
            break;
        case 1:
            // 读取药店数据
            _crtSelectData = [HDRGlobalData instance].drugStoreData;
            break;
        case 2:
            // 读取药品数据
            _crtSelectData = [HDRGlobalData instance].drugData;
            break;
            
        default:
            break;
    }
    [self.tableView reloadData];
}

-(void)changeSegment:(id)sender
{
    int idx = _segCtrl.selectedSegmentIndex;
//    NSLog(@"%d", idx);
    [self setSegCtrlData:idx];
}

- (void) selectCrtSegIndex:(NSInteger)idx
{
    _segCtrl.selectedSegmentIndex = idx;
    [self setSegCtrlData:idx];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
//    NSLog(@"aaa");
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
//    NSLog(@"bbb %d", [_crtSelectData count]);
    return [_crtSelectData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger cellType = _segCtrl.selectedSegmentIndex;
    UITableViewCell * cell;
    NSDictionary * dict = [_crtSelectData objectAtIndex:indexPath.row];
    
    if (cellType == 0) {
        cell = [HDRHospitalCell cellWithTabelView:tableView withData:dict];
    }
    else if (cellType == 1)
    {
        cell = [HDRDrugStoreCell cellWithTabelView:tableView withData:dict];
    }
    else
    {
        cell = [HDRDrugCell cellWithTabelView:tableView withData:dict];
    }
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dict = [_crtSelectData objectAtIndex:indexPath.row];
    NSString *titileString = [dict objectForKey:@"name"];
    
    HDRHospitalInfoViewCtrl * info = [[HDRHospitalInfoViewCtrl alloc] init];
    [info setInfoData:titileString];
    [self.navigationController pushViewController:info animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger cellType = _segCtrl.selectedSegmentIndex;
    if (cellType == 0) {
        return 64;
    }
    else if (cellType == 1)
    {
        return 64;
    }
    else
    {
        return 44;
    }
    return [super tableView:tableView heightForRowAtIndexPath:indexPath];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
