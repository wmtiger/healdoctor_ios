//
//  HDRSelectTypeTableViewCtrl.m
//  hdrdemo5
//
//  Created by wei sm on 14-6-1.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HDRSelectTypeTableViewCtrl.h"

@interface HDRSelectTypeTableViewCtrl ()

@end

@implementation HDRSelectTypeTableViewCtrl

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
    
    _types = [[NSMutableArray alloc] initWithObjects:@"医院", @"药店", @"药品", nil];
    
    [self initHeadView];
}

- (void) initHeadView
{
    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    
    UIImageView * bg = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"bg_navbar"]];
    bg.frame = CGRectMake(0, 0, 320, 44);
    [_headView addSubview:bg];
    
    UIImageView * backBtnBg = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"bg_backbtn"]];
    backBtnBg.frame = CGRectMake(10, 0, 53, 44);
    [_headView addSubview:backBtnBg];
    
    
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(10, 0, 53, 44);
    backBtn.backgroundColor = [UIColor clearColor];
    [backBtn addTarget:self action:@selector(clickBack:) forControlEvents:UIControlEventTouchUpInside];
    [_headView addSubview:backBtn];
    
    
    UISearchBar * searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(80, 0, 240, 44)];
    searchbar.keyboardType = UIKeyboardTypeDefault;
    searchbar.delegate = self;
    [(UIView *)[searchbar.subviews objectAtIndex:0] removeFromSuperview];
    [_headView addSubview:searchbar];
    
    searchbar.placeholder = @"输入类型名搜索";
    
    self.tableView.tableHeaderView = _headView;
}

- (void)clickBack:(id)sender
{
    //    NSLog(@"click city");
    [self closeSelectView];
}

- (void) closeSelectView
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar;
{
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
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
    return [_types count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    // Configure the cell...
    cell.textLabel.text = [_types objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *titileString = [_types objectAtIndex:indexPath.row];
    
    [_selectDelegate selectedTypeName:titileString];
    [self closeSelectView];
    //    UIAlertView *alert = [[ UIAlertView alloc]initWithTitle:@"提示" message:titileString delegate:self cancelButtonTitle:@"OK"otherButtonTitles: nil];
    //    [alert show];
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
