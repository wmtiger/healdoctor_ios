//
//  HDRHospitalViewCtrl.m
//  hdrdemo5
//
//  Created by wei sm on 14-5-22.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HDRHospitalViewCtrl.h"

@interface HDRHospitalViewCtrl ()

@end

@implementation HDRHospitalViewCtrl

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
    
    self.searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    [self.view addSubview:self.searchbar];
    NSArray * titles = [[NSArray alloc]initWithObjects:@"医院", @"药店", @"药品", nil];
    self.searchbar.scopeButtonTitles =titles;
    self.searchbar.showsScopeBar = YES;
    
    self.searchctrl = [[UISearchDisplayController alloc] initWithSearchBar:self.searchbar contentsController:self];
    self.searchctrl.delegate = self;
    self.searchctrl.searchResultsDelegate = self;
    self.searchctrl.searchResultsDataSource = self;

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
    return 1;
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
