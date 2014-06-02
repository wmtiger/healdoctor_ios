//
//  HDRNearCtrl.h
//  hdrdemo5
//
//  Created by apple on 14-5-18.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface HDRNearCtrl : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>

@property (nonatomic, strong) MKMapView * mapView;

//@property (nonatomic, weak)

- (void) showPositionWithLat:(CGFloat)lat long:(CGFloat)lon;

@end
