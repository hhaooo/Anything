//
//  WeatherViewController.m
//  Anything
//
//  Created by 洪浩 on 15/7/27.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#import "WeatherViewController.h"


@interface WeatherViewController ()

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureData];
    [self configureView];
    [self loadViews];
    // Do any additional setup after loading the view.
}

-(void)configureData{
    
    Weather *cachedWeather = [FileTool readWeatherFromFileWithCity:self.cityName];
    if (cachedWeather) {
        self.result = cachedWeather.results[0];
        self.index = self.result.index;
        self.weatherData = self.result.weather_data;
        self.weather = cachedWeather;
    }
    
}

-(void)configureView{
    
    self.cityLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 3)];
    self.cityLabel.textAlignment = NSTextAlignmentCenter;
    self.cityLabel.textColor = [UIColor blackColor];
    self.cityLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:75];
    self.cityLabel.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:self.cityLabel];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height / 3, self.view.frame.size.width, self.view.frame.size.height - self.view.frame.size.height/3)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorColor = [UIColor colorWithWhite:1 alpha:0.2];
    self.tableView.allowsSelection = NO;
    [self.view addSubview:self.tableView];
    NSLog(@"45645634564");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    static NSString *HeaderTableViewCellID = @"HeaderTableViewCell";
    HeaderTableViewCell* headerCell = [tableView dequeueReusableCellWithIdentifier:HeaderTableViewCellID];

    headerCell.backgroundColor = [UIColor blackColor];
    
    NSLog(@"inTableViewCell");
    
    if (indexPath.section == 0) {
        if (self.weather) {
            headerCell.weather = self.weather;
        }
        return headerCell;
    }
    
        NSLog(@"123123213131312");
    
    return headerCell;
}

-(NSInteger)numberOfSectionsInTableView:(nonnull UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 1;
    }
    else
        return 2;
}

-(CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return self.view.frame.size.height/2;
    }else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return 44;
        }
        return 44*3;
    }else{
        if (indexPath.row == 0) {
            return 44;
        }
        return 136 * 6;
    }
}

-(void)loadViews{
    
    UIImage *blurImage;
    if (self.weather) {
        WeatherData *todayWeatherData = self.weatherData[0];
        NSString *todayWeather = todayWeatherData.weather;
        blurImage = [UIImage imageNamed:[WeatherTool getBackgroundImageWithWeatherName:todayWeather]];
    }else{
        blurImage = [UIImage imageNamed:@"bg_na"];
    }
    self.backgroundImageView.image = blurImage;
    //load city name
    if (self.cityName) {
        self.cityLabel.text = self.cityName;
    }else{
        self.cityLabel.text = self.result.currentCity;
    }
    //load tableview
    self.tableView.backgroundColor = [UIColor blackColor];
    [self.tableView reloadData];
    
    NSLog(@"loadviews");
}

-(void)locationFailed{
    
    
}

-(void)locationReceived:(CLLocation *)location{
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
