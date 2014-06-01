//
//  HDRDrugStoreCell.h
//  hdrdemo5
//
//  Created by wei sm on 14-6-1.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HDRDrugStoreCell : UITableViewCell

@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * descLabel;
@property (nonatomic, strong) UIImageView * yibaoImg;
@property (nonatomic, strong) UIImageView * is24TimeImg;
@property (nonatomic, strong) UIButton * positionBtn;
@property (nonatomic, strong) UIButton * navToBtn;

+ (HDRDrugStoreCell *) cellWithTabelView:(UITableView *)tableView withData:(NSDictionary *)data;

@end
