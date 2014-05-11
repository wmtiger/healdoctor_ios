//
//  HDRNearViewCtrl.m
//  hdrdemo3
//
//  Created by apple on 14-5-10.
//  Copyright (c) 2014年 bf. All rights reserved.
//

#import "HDRNearViewCtrl.h"

@interface HDRNearViewCtrl () <CLLocationManagerDelegate>
{
@protected CLLocationCoordinate2D myCoords;
}
@property (nonatomic, retain)CLLocationManager * locationManager;
@property (nonatomic, retain)CLLocation * location;
@property (nonatomic, retain)CLGeocoder * myGeocoder;

@end

@implementation HDRNearViewCtrl

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
    
    NSLog(@"near viewDidLoad");
    if ([CLLocationManager locationServicesEnabled]) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        // 精度
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = kCLHeadingFilterNone;
        // 开始更新位置
        [self.locationManager startUpdatingLocation];
        
        self.myGeocoder = [[CLGeocoder alloc] init];
        
        
    }
    else
    {
        NSLog(@"Location services are not enabled");
    }
    
//    self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, [UIScreen mainScreen].bounds.size.height-20-44)];
//    [self.view addSubview:self.mapView];
//    self.mapView.mapType = MKMapTypeStandard;
//    self.mapView.showsUserLocation = YES;
//    self.mapView.delegate = self;
//    
//    myCoords = self.mapView.userLocation.location.coordinate;
//    CLLocationCoordinate2D coordinate = self.mapView.userLocation.location.coordinate;
//    
//    MKCoordinateSpan span = MKCoordinateSpanMake(0.04, 0.04);
//    self.mapView.region = MKCoordinateRegionMake(coordinate, span);
//    [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(zoomToAnnotations) userInfo:nil repeats:NO];
}

#pragma mark - Implements Delegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    NSLog(@"didChangeAuthorizationStatus - %u", status);
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError - %@", error);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation * crtLocation = [locations lastObject];
    NSLog(@"%3.5f, %3.5f", crtLocation.coordinate.latitude, crtLocation.coordinate.longitude);
    [self testGeoLocation:crtLocation];
    NSLog(@"%@", crtLocation);
}

- (void)testGeoLocation:(CLLocation *)location
{
    [self.myGeocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error == nil && [placemarks count] > 0) {
            CLPlacemark * placemark = [placemarks objectAtIndex:0];
            
            NSLog(@"Country = %@", placemark.country);
            NSLog(@"Postal Coed = %@", placemark.postalCode);
            NSLog(@"Locality = %@", placemark.locality);
            NSLog(@"dic = %@", placemark.addressDictionary);
            NSLog(@"dic FormattedAddressLines = %@", [placemark.addressDictionary objectForKey:@"FormattedAddressLines"]);
            NSLog(@"dic Name = %@", [placemark.addressDictionary objectForKey:@"Name"]);
            NSLog(@"dic State = %@", [placemark.addressDictionary objectForKey:@"State"]);
            NSLog(@"dic Street = %@", [placemark.addressDictionary objectForKey:@"Street"]);
            NSLog(@"dic SubLocality= %@", [placemark.addressDictionary objectForKey:@"SubLocality"]);
            NSLog(@"dic SubThoroughfare= %@", [placemark.addressDictionary objectForKey:@"SubThoroughfare"]);
            NSLog(@"dic Thoroughfare = %@", [placemark.addressDictionary objectForKey:@"Thoroughfare"]);
        }
        else if (error == nil && [placemarks count] == 0)
        {
            NSLog(@"No results were returned");
        }
        else if (error == nil)
        {
            NSLog(@"An error occurred = %@", error);
        }
    }];
}

-(void)zoomToAnnotations
{
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = myCoords;
    annotation.title = @"东仓花园";
    annotation.subtitle = @"中国机械加工网";
    
    
    // 指定新的显示区域
    [self.mapView setRegion:MKCoordinateRegionMake(annotation.coordinate, MKCoordinateSpanMake(0.02, 0.02)) animated:YES];
    
    // 选中标注
    [self.mapView selectAnnotation:annotation animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
