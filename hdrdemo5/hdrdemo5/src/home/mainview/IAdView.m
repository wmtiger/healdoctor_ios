//
//  IAdView.m
//  hdrdemo3
//
//  Created by wei sm on 14-5-3.
//  Copyright (c) 2014年 bf. All rights reserved.
//

#import "IAdView.h"
#import "IAdObj.h"

@implementation IAdView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initAdView];
    }
    return self;
}

- (void)initAdView
{
//    NSLog(@"initadview");
    NSString * picsURL = @"adholder.png";
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
    UIImage *image = [UIImage imageNamed:picsURL];
    [self.imageView setImage:image];
    [self addSubview:self.imageView];
    
    self.title = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, 320, 20)];
    self.title.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    [self addSubview:self.title];
}

- (void)setIAdObj:(IAdObj *)obj
{
    NSString * picsURL = [obj.url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:picsURL]];
    [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
    [request setTimeoutInterval:60];
    [request setHTTPShouldHandleCookies:FALSE];
    [request setHTTPMethod:@"GET"];
    
    self.conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [self.conn start];
    
    NSString * labelHead = @"  ";
    self.title.text = [labelHead stringByAppendingString:obj.title];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.returnData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
//    NSLog(@"ok");
    self.returnData = [[NSMutableData alloc]init];
    self.response = (NSHTTPURLResponse *)response;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if (self.response.statusCode == 200) {
        UIImage * image = [UIImage imageWithData:self.returnData];
        [self.imageView setImage:image];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
