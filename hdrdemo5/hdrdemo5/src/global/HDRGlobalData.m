//
//  HDRGlobalData.m
//  hdrdemo5
//
//  Created by wei sm on 14-5-30.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "HDRGlobalData.h"

@implementation HDRGlobalData

static HDRGlobalData * globalData = nil;

+(HDRGlobalData *)instance{
    @synchronized(self){
        if(globalData == nil){
            globalData = [[self alloc] init];
            [globalData initAllData];
        }
    }
    return globalData;
}

+(id)allocWithZone:(NSZone *)zone{
    @synchronized(self){
        if (globalData == nil) {
            globalData = [super allocWithZone:zone];
            return  globalData;
        }
    }
    return nil;
}

- (void)initAllData
{
    [self initDrugData];
    [self initDrugStoreData];
    [self initHospitalData];
    [self initCityData];
}

- (void)initCityData
{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"citydict" ofType:@"plist"];
    _cityDict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSArray * arr = [[_cityDict allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    _cityKeys = [[NSMutableArray alloc]initWithArray:arr];
//    NSString * lastKey = [_cityKeys lastObject];
//    [_cityKeys removeLastObject];
//    [_cityKeys insertObject:lastKey atIndex:0];
}

- (void)initDrugData
{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"drug2" ofType:@"json"];
    NSData * data = [NSData dataWithContentsOfFile:path];
    _drugData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    
}

- (void)initDrugStoreData
{
    _drugStoreData = [[NSMutableArray alloc]init];
}

- (void)initHospitalData
{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"hospital2" ofType:@"json"];
    NSData * data = [NSData dataWithContentsOfFile:path];
    _hospitalData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    
}

@end
