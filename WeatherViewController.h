//
//  WeatherViewController.h
//  Anything
//
//  Created by 洪浩 on 15/7/27.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationTool.h"
#import "Weather.h"
#import "Results.h"
#import "WeatherIndex.h"
#import "WeatherTool.h"
#import "WeatherData.h"
#import "FileTool.h"
#import "HeaderTableViewCell.h"
#import "ForecastItemTableViewCell.h"
#import "ForecastTableViewCell.h"
#import "IndexItemTableViewCell.h"
#import "IndexTableViewCell.h"
#import "TitleTableViewCell.h"
#import "HttpTool.h"
#import "LocationTool.h"


@interface WeatherViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,LocationToolDelegate>

@property(nonatomic,strong) Weather *weather;
@property(nonatomic,strong) Results *result;
@property(nonatomic,strong) NSArray *index;
@property(nonatomic,strong) NSArray *weatherData;
@property(nonatomic,strong) LocationTool* locationTool;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong)  UIImageView *backgroundImageView;
@property(nonatomic,strong)  UILabel *cityLabel;

@property(nonatomic,copy) NSString *cityName;
@property(nonatomic,assign)int page;

-(void)configureView;
-(void)loadViews;

@end
