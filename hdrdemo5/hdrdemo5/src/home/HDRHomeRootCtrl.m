//
//  HDRHomeRootCtrl.m
//  hdrdemo5
//
//  Created by apple on 14-5-18.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HDRHomeRootCtrl.h"
#import "HDRHomeHeadSearchCtrl.h"
#import "HDRHomeHeadSearchBar.h"
#import "HDRHomeNewsBar.h"
#import "HDRHomeAdsView.h"
#import "HDRHomeFunsBar.h"
#import "HDRHomeAtentionView.h"
#import "HDRHomeAtentionCell.h"

#import "HDRHospitalViewCtrl.h"
#import "HDRDrugViewCtrl.h"
#import "HDRExamViewCtrl.h"
#import "HDRToolViewCtrl.h"

@interface HDRHomeRootCtrl ()
{
    HDRHomeAdsView * adsview;
    HDRHomeAtentionView * atentionview;
}
@end

@implementation HDRHomeRootCtrl

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
    
    HDRHomeHeadSearchBar * headSearchBar = [[HDRHomeHeadSearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [self.view addSubview:headSearchBar];
    
    HDRHomeHeadSearchCtrl * headSearchBarCtrl = [[HDRHomeHeadSearchCtrl alloc] initWithSearchBar:headSearchBar.searchbar contentsController:self];
    headSearchBarCtrl.delegate = self;
    headSearchBarCtrl.searchResultsDelegate = self;
    headSearchBarCtrl.searchResultsDataSource = self;
    
    HDRHomeNewsBar * newsbar = [[HDRHomeNewsBar alloc] initWithFrame:CGRectMake(0, 44, 320, 20)];
    [self.view addSubview:newsbar];
    
    adsview = [[HDRHomeAdsView alloc] initWithFrame:CGRectMake(0, 64, 320, 150)];
    [self.view addSubview:adsview];
    
    HDRHomeFunsBar * funsbar = [[HDRHomeFunsBar alloc] initWithFrame:CGRectMake(0, 214, 320, 80)];
    [self.view addSubview:funsbar];
    funsbar.delegate = self;
   
    
    self.dataList = [NSMutableArray arrayWithObjects:@"男神",@"女神", nil];
    
    atentionview = [[HDRHomeAtentionView alloc] initWithFrame:CGRectMake(0, 294, 320, 480-294-49)];
    atentionview.dataSource = self;
    atentionview.delegate = self;
    [self.view addSubview:atentionview];
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    return YES;
}

/**
 *加以下俩方法可以实现nav的root不显示navbar，其他的view显示navbar
 */
- (void)viewWillAppear:(BOOL)animated {
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    
    [adsview resumeScroll];
}

- (void)viewWillDisappear:(BOOL)animated {
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
    
    [adsview pauseScroll];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource, delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"Cell";
    HDRHomeAtentionCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell == nil) {
        cell = [[HDRHomeAtentionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier];
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [self.dataList objectAtIndex:row];
    if ([cell.textLabel.text isEqualToString:@"男神"]) {
        cell.imageView.image = [UIImage imageNamed:@"green.png"];
    }
    else
    {
        cell.imageView.image = [UIImage imageNamed:@"blue.png"];
    }
    
    cell.detailTextLabel.text = @"详细信息";
    return cell;
}

#pragma mark - HDRHomeFunsDelegate

- (void)showHospital
{
    [self.navigationController pushViewController:[[HDRHospitalViewCtrl alloc] init] animated:YES];
}

- (void)showDrug
{
    [self.navigationController pushViewController:[[HDRDrugViewCtrl alloc] init] animated:YES];
}

- (void)showExam
{
    [self.navigationController pushViewController:[[HDRExamViewCtrl alloc] init] animated:YES];
}

- (void)showTool
{
    [self.navigationController pushViewController:[[HDRToolViewCtrl alloc] init] animated:YES];
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
