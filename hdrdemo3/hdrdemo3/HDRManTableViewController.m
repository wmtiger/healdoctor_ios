//
//  HDRManTableViewController.m
//  hdrdemo3
//
//  Created by wei sm on 14-5-3.
//  Copyright (c) 2014年 bf. All rights reserved.
//

#import "HDRManTableViewController.h"

@interface HDRManTableViewController ()

@end

@implementation HDRManTableViewController

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
    
    [self initDataList: [self getDataListFilePath]];
    
}

- (NSString *)getDataListFilePath
{
    return @"ManList.plist";
}

- (void)initDataList:(NSString *)filePath
{
    self.dataList = [@[] mutableCopy];
    NSString * path = [[NSBundle mainBundle] pathForResource:filePath ofType:nil];
    self.dataList = [self.dataList initWithContentsOfFile:path];
    NSLog(@"%@", [[self.dataList objectAtIndex:0] objectForKey:@"title"]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.dataList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSArray * arr = [[self.dataList objectAtIndex:section] objectForKey:@"list"];
    return [arr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    NSArray * arr = [[self.dataList objectAtIndex:section] objectForKey:@"list"];
    
    NSString * CELL = [self getCellName];
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CELL forIndexPath:indexPath];
    
    cell.textLabel.text = [[arr objectAtIndex:row] objectForKey:@"name"];
    // Configure the cell...
    
    return cell;
}

- (NSString *)getCellName
{
    return @"ManCell";
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString * headName = [[self.dataList objectAtIndex:section] objectForKey:@"title"];
    return headName;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"click %d,%d", indexPath.section, indexPath.row);
}

/*
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray * list = [NSMutableArray arrayWithCapacity:20];
    for (NSDictionary *dict in self.manList) {
        [list addObject:[dict objectForKey:@"title"]];
    }
    return list;
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
