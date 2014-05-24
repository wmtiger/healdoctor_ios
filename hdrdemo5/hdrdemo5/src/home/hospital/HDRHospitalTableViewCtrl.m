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
    
    self.searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
//    self.searchbar
    for (UIView * subview in self.searchbar.subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"UITextField")]) {
            CGRect f = subview.frame;
            subview.frame = CGRectMake(f.origin.x+60, f.origin.y, f.size.width-60, f.size.height);
            NSLog(@"hah");
            break;
        }
    }
    self.tableView.tableHeaderView = self.searchbar;
    NSArray * titles = [[NSArray alloc]initWithObjects:@"医院", @"药店", @"药品", nil];
    self.searchbar.scopeButtonTitles =titles;
    self.searchbar.showsScopeBar = YES;
    self.searchbar.delegate = self;
    
//    self.searchctrl = [[UISearchDisplayController alloc] initWithSearchBar:self.searchbar contentsController:self];
//    self.searchctrl.delegate = self;
//    self.searchctrl.searchResultsDelegate = self;
//    self.searchctrl.searchResultsDataSource = self;
    
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

-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [self.searchbar setShowsCancelButton:NO animated:YES];
    [self.searchbar resignFirstResponder];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
}

-(void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
