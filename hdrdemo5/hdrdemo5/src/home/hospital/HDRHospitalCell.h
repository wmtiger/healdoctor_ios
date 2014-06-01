//
//  HDRHospitalCell.h
//  hdrdemo5
//
//  Created by wei sm on 14-6-1.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HDRHospitalCell : UITableViewCell

@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * descLabel;
@property (nonatomic, strong) UIImageView * levelImg;
@property (nonatomic, strong) UIImageView * yibaoImg;
@property (nonatomic, strong) UIButton * positionBtn;
@property (nonatomic, strong) UIButton * navToBtn;

+ (HDRHospitalCell *) cellWithTabelView:(UITableView *)tableView withData:(NSDictionary *)data;

@end
