//
//  HDRGlobalData.h
//  hdrdemo5
//
//  Created by wei sm on 14-5-30.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HDRGlobalData : NSObject

@property (nonatomic, strong) NSMutableArray * drugData;

@property (nonatomic, strong) NSMutableArray * hospitalData;

@property (nonatomic, strong) NSMutableArray * drugStoreData;

@property (nonatomic, strong) NSMutableArray * cityKeys;
@property (nonatomic, strong) NSDictionary * cityDict;

+(HDRGlobalData *)instance;

//- (void)initDrugData;
//
//- (void)initDrugStoreData;
//
//- (void)initHospitalData;

//- (void)initAllData;

@end
