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
}

- (void)initDrugData
{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"drug" ofType:@"json"];
    NSLog(@"%@", path);
    NSData * data = [NSData dataWithContentsOfFile:path];
    _drugData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//    NSDictionary * dict = [_drugData objectAtIndex:0];
//    NSLog(@"%@", [dict objectForKey:@"name"] );
    NSLog(@"drugdata len: %d", [_drugData count]);
}

- (void)initDrugStoreData
{
    _drugStoreData = [[NSMutableArray alloc]init];
}

- (void)initHospitalData
{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"hospital" ofType:@"json"];
    NSLog(@"%@", path);
    NSData * data = [NSData dataWithContentsOfFile:path];
    _hospitalData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//    NSDictionary * dict = [_hospitalData objectAtIndex:0];
//    NSLog(@"%@", [dict objectForKey:@"name"] );
    NSLog(@"_hospitalData len: %d", [_hospitalData count]);
}

@end
