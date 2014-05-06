//
//  HDRDrugTableViewCtrl.m
//  hdrdemo3
//
//  Created by wei sm on 14-5-7.
//  Copyright (c) 2014年 bf. All rights reserved.
//

#import "HDRDrugTableViewCtrl.h"

@interface HDRDrugTableViewCtrl ()
{
    
}

@property(nonatomic, copy) NSArray *diseaseList;
@property(nonatomic, copy) NSArray *filteredDisease;
@property(nonatomic, copy) NSArray *sections;

@property(nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic, strong, readwrite) UISearchBar *searchBar;

@property(nonatomic, strong) UISearchDisplayController *strongSearchDisplayController;
@end

@implementation HDRDrugTableViewCtrl

- (id)initWithSectionIndexes:(BOOL)showSectionIndexes
{
    NSLog(@"initWithSectionIndexes");
    
    if ((self = [super initWithNibName:nil bundle:nil])) {
        self.title = @"Search Bar";
        
        self.showSectionIndexes = showSectionIndexes;
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Disease" ofType:@"plist"];
        _diseaseList = [[NSArray alloc] initWithContentsOfFile:path];
        NSLog(@"%@", [self.diseaseList objectAtIndex:0]);
        
        if (showSectionIndexes) {
            UILocalizedIndexedCollation *collation = [UILocalizedIndexedCollation currentCollation];
            
            NSMutableArray *unsortedSections = [[NSMutableArray alloc] initWithCapacity:[[collation sectionTitles] count]];
            for (NSUInteger i = 0; i < [[collation sectionTitles] count]; i++) {
                [unsortedSections addObject:[NSMutableArray array]];
            }
            
            for (NSString *diseaseName in self.diseaseList) {
                NSInteger index = [collation sectionForObject:diseaseName collationStringSelector:@selector(description)];
                [[unsortedSections objectAtIndex:index] addObject:diseaseName];
            }
            
            NSMutableArray *sortedSections = [[NSMutableArray alloc] initWithCapacity:unsortedSections.count];
            for (NSMutableArray *section in unsortedSections) {
                [sortedSections addObject:[collation sortedArrayFromArray:section collationStringSelector:@selector(description)]];
            }
            
            self.sections = sortedSections;
        }
    }
    
    return self;

}

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
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
    self.searchBar.placeholder = @"输入疾病或症状拼音首字母";
    self.searchBar.delegate = self;
    
    [self.searchBar sizeToFit];
    
    self.strongSearchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
    self.searchDisplayController.searchResultsDataSource = self;
    self.searchDisplayController.searchResultsDelegate = self;
    self.searchDisplayController.delegate = self;
    
    self.tableView.tableHeaderView = self.searchBar;
    
    // The search bar is hidden when the view becomes visible the first time
    self.tableView.contentOffset = CGPointMake(0, CGRectGetHeight(self.searchBar.bounds));

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (animated) {
        [self.tableView flashScrollIndicators];
    }
}

- (void)scrollTableViewToSearchBarAnimated:(BOOL)animated
{
    [self.tableView scrollRectToVisible:self.searchBar.frame animated:animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate and DataSource

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (tableView == self.tableView && self.showSectionIndexes) {
        return [[NSArray arrayWithObject:UITableViewIndexSearch] arrayByAddingObjectsFromArray:[[UILocalizedIndexedCollation currentCollation] sectionIndexTitles]];
    } else {
        return nil;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView == self.tableView && self.showSectionIndexes) {
        if ([[self.sections objectAtIndex:section] count] > 0) {
            return [[[UILocalizedIndexedCollation currentCollation] sectionTitles] objectAtIndex:section];
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if ([title isEqualToString:UITableViewIndexSearch]) {
        [self scrollTableViewToSearchBarAnimated:NO];
        return NSNotFound;
    } else {
        return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index] - 1; // -1 because we add the search symbol
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.tableView) {
        if (self.showSectionIndexes) {
            return self.sections.count;
        } else {
            return 1;
        }
    } else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.tableView) {
        if (self.showSectionIndexes) {
            return [[self.sections objectAtIndex:section] count];
        } else {
            return self.diseaseList.count;
        }
    } else {
        return self.filteredDisease.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self getCellName]];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self getCellName]];
    }
    
    if (tableView == self.tableView) {
        if (self.showSectionIndexes) {
            cell.textLabel.text = [[self.sections objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        } else {
            cell.textLabel.text = [self.diseaseList objectAtIndex:indexPath.row];
        }
    } else {
        cell.textLabel.text = [self.filteredDisease objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (NSString *)getCellName
{
    return @"DurgCell";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Search Delegate

- (void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller
{
    self.filteredDisease = self.diseaseList;
}

- (void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller
{
    self.filteredDisease = nil;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    self.filteredDisease = [self.filteredDisease filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF contains[cd] %@", searchString]];
    
    return YES;
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
