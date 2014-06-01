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

#import "HDRHospitalTableViewCtrl.h"
#import "HDRDrugViewCtrl.h"
#import "HDRExamViewCtrl.h"
#import "HDRToolViewCtrl.h"
#import "HDRSelectCityTableViewCtrl.h"
#import "HDRSelectTypeTableViewCtrl.h"
#import "HDRNanShenViewCtrl.h"
#import "HDRNvShenViewCtrl.h"


@interface HDRHomeRootCtrl ()
{
    HDRHomeAdsView * adsview;
    HDRHomeAtentionView * atentionview;
    HDRHomeHeadSearchBar * headSearchBar;
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
    
    headSearchBar = [[HDRHomeHeadSearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
    headSearchBar.delegate = self;
    [self.view addSubview:headSearchBar];
    
//    HDRHomeHeadSearchCtrl * headSearchBarCtrl = [[HDRHomeHeadSearchCtrl alloc] initWithSearchBar:headSearchBar.searchbar contentsController:self];
//    headSearchBarCtrl.delegate = self;
//    headSearchBarCtrl.searchResultsDelegate = self;
//    headSearchBarCtrl.searchResultsDataSource = self;
    
    HDRHomeNewsBar * newsbar = [[HDRHomeNewsBar alloc] initWithFrame:CGRectMake(0, headSearchBar.frame.size.height, 320, 34)];
    [self.view addSubview:newsbar];
    
    adsview = [[HDRHomeAdsView alloc] initWithFrame:CGRectMake(0, newsbar.frame.origin.y + newsbar.frame.size.height, 320, 135)];
    [self.view addSubview:adsview];
    
    HDRHomeFunsBar * funsbar = [[HDRHomeFunsBar alloc] initWithFrame:CGRectMake(0, adsview.frame.origin.y + adsview.frame.size.height, 320, 82)];
    [self.view addSubview:funsbar];
    funsbar.delegate = self;
    
    self.dataList = [NSMutableArray arrayWithObjects:@"男神",@"女神", nil];
    
    atentionview = [[HDRHomeAtentionView alloc] initWithFrame:CGRectMake(0, funsbar.frame.origin.y + funsbar.frame.size.height, 320, 460-headSearchBar.frame.size.height - newsbar.frame.size.height - adsview.frame.size.height - funsbar.frame.size.height - 49)];
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
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    
    [adsview resumeScroll];
    
//    NSLog(@"%s", __FUNCTION__);
    [_delegate showHomeTabbar];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
    
    [adsview pauseScroll];
//    NSLog(@"%s", __FUNCTION__);
    [_delegate hideHomeTabbar];
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
        cell = [[HDRHomeAtentionCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellWithIdentifier];
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [self.dataList objectAtIndex:row];
    if ([cell.textLabel.text isEqualToString:@"男神"]) {
        cell.imageView.image = [UIImage imageNamed:@"green.png"];
        cell.detailTextLabel.text = @"男士体检、减肥锻炼";
    }
    else
    {
        cell.imageView.image = [UIImage imageNamed:@"blue.png"];
        cell.detailTextLabel.text = @"女士体检、减肥锻炼";
    }
    
//    cell.detailTextLabel.text = @"详细信息";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *titileString = [_dataList objectAtIndex:indexPath.row];
    if ([titileString isEqualToString:@"男神"]) {
        [self showNanshen];
    }
    else
    {
        [self showNvshen];
    }
    
    //    UIAlertView *alert = [[ UIAlertView alloc]initWithTitle:@"提示" message:titileString delegate:self cancelButtonTitle:@"OK"otherButtonTitles: nil];
    //    [alert show];
}

#pragma mark - SelectCityDelegate

- (void) selectedCityName:(NSString *) name
{
    [headSearchBar setCityBtnName:name];
}
- (void) selectedTypeName:(NSString *) name
{
    [headSearchBar setTypeBtnName:name];
}


#pragma mark - HDRHomeSearchDelegate

- (void)toShowHospital
{
    HDRHospitalTableViewCtrl * hospitalVC = [[HDRHospitalTableViewCtrl alloc] init];
    [self.navigationController pushViewController:hospitalVC animated:YES];
    [hospitalVC selectCrtSegIndex:0];

    [hospitalVC addSearchBar];
}

- (void)toShowDrugStore
{
    HDRHospitalTableViewCtrl * hospitalVC = [[HDRHospitalTableViewCtrl alloc] init];
    
    [self.navigationController pushViewController:hospitalVC animated:YES];
    [hospitalVC selectCrtSegIndex:1];
    [hospitalVC addSearchBar];
}

- (void)toShowDrug
{
    HDRHospitalTableViewCtrl * hospitalVC = [[HDRHospitalTableViewCtrl alloc] init];
//    [hospitalVC selectCrtSegIndex:2];
    [self.navigationController pushViewController:hospitalVC animated:YES];
    [hospitalVC selectCrtSegIndex:2];
    [hospitalVC addSearchBar];
}

- (void) showSelectCityView
{
    HDRSelectCityTableViewCtrl * selectCity = [[HDRSelectCityTableViewCtrl alloc] init];
    selectCity.selectDelegate = self;
    [self presentViewController:selectCity animated:YES completion:^{
        
    }];
}
- (void) showSelectTypeView
{
    HDRSelectTypeTableViewCtrl * selectCity = [[HDRSelectTypeTableViewCtrl alloc] init];
    selectCity.selectDelegate = self;
    [self presentViewController:selectCity animated:YES completion:^{
        
    }];
}


#pragma mark - HDRHomeFunsDelegate

- (void)showHospital
{
    HDRDrugViewCtrl * drugVC = [[HDRDrugViewCtrl alloc] init];

    [self.navigationController pushViewController:drugVC animated:YES];
    [drugVC selectCrtSegIndex:0];
    [drugVC addSearchBar];
    
}

- (void)showDrug
{
    HDRDrugViewCtrl * drugVC = [[HDRDrugViewCtrl alloc] init];
    
    [self.navigationController pushViewController:drugVC animated:YES];
    [drugVC selectCrtSegIndex:1];
    [drugVC addSearchBar];
    
}

- (void)showExam
{
    [self.navigationController pushViewController:[[HDRExamViewCtrl alloc] init] animated:YES];
}

- (void)showTool
{
    [self.navigationController pushViewController:[[HDRToolViewCtrl alloc] init] animated:YES];
}

- (void) showNanshen
{
    HDRNanShenViewCtrl * nanVC = [[HDRNanShenViewCtrl alloc] init];
    
    [self.navigationController pushViewController:nanVC animated:YES];
}

- (void) showNvshen
{
    HDRNvShenViewCtrl * nvVC = [[HDRNvShenViewCtrl alloc] init];
    
    [self.navigationController pushViewController:nvVC animated:YES];
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
