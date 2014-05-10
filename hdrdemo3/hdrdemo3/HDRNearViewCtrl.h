//
//  HDRNearViewCtrl.h
//  hdrdemo3
//
//  Created by apple on 14-5-10.
//  Copyright (c) 2014年 bf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface HDRNearViewCtrl : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) MKMapView *mapView;

@end
