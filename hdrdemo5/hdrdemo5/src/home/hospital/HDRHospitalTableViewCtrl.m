//
//  HDRHospitalTableViewCtrl.m
//  hdrdemo5
//
//  Created by apple on 14-5-24.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HDRHospitalTableViewCtrl.h"

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
    
    _searchbar = [[UISearchBar alloc]initWithFrame:CGRectMake(60, 0, 260, 44)];
    [self.navigationController.navigationBar addSubview:_searchbar];
    _searchbar.delegate = self;
    
//    _headBar = [[HDRHospitalHeadBar alloc] initWithFrame:CGRectMake(0, 0, 320, 140)];
//    self.tableView.tableHeaderView = _headBar;
//    _headBar.delegate = self;
//    [self.navigationController.navigationBar addSubview:_headBar];
    
    _segView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    self.tableView.tableHeaderView = _segView;
    _segView.backgroundColor = [UIColor blueColor];
    
    _segCtrl = [[UISegmentedControl alloc] initWithItems:[[NSArray alloc] initWithObjects:@"医院", @"药店", @"药品", nil]];
    _segCtrl.frame = CGRectMake(30, 6, 260, 32);
    _segCtrl.segmentedControlStyle = UISegmentedControlStyleBar;
    [_segView addSubview:_segCtrl];
    _segCtrl.selectedSegmentIndex = 0;
    [_segCtrl addTarget:self action:@selector(changeSegment:) forControlEvents:UIControlEventValueChanged];
}

-(void)setSegCtrlData:(NSInteger)idx
{
    switch (idx) {
        case 0:
            // 读取医院数据
            _crtSelectData = _hospitalData;
            break;
        case 1:
            // 读取药店数据
            _crtSelectData = _drugStoreData;
            break;
        case 2:
            // 读取药品数据
            _crtSelectData = _drugData;
            break;
            
        default:
            break;
    }
//    self.tableView.
}

-(void)changeSegment:(id)sender
{
    int idx = _segCtrl.selectedSegmentIndex;
    NSLog(@"%d", idx);
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
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
