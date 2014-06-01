//
//  HDRNearCtrl.m
//  hdrdemo5
//
//  Created by apple on 14-5-18.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HDRNearCtrl.h"

@interface HDRNearCtrl ()

@end

@implementation HDRNearCtrl

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
    
    _mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    [self.view addSubview:_mapView];
//    _mapView.mapType = MKMapTypeStandard;
    _mapView.mapType = MKMapTypeHybrid;
    _mapView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MapViewDelegate

- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"地图加载错误" message:@"error" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    if ([CLLocationManager locationServicesEnabled])
    {
//        _mapView.mapType = MKMapTypeStandard;
//        _mapView.delegate = self;
        _mapView.showsUserLocation = YES;
        [_mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    }
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
