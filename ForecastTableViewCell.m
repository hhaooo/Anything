//
//  ForecastTableViewCell.m
//  Anything
//
//  Created by 洪浩 on 15/8/7.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#import "ForecastTableViewCell.h"
#import "WeatherData.h"
#import "ForecastItemTableViewCell.h"
#import "WeatherTool.h"

@implementation ForecastTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setWeatherData:(NSArray *)weatherData{
    _weatherData = weatherData;
    [self.tableView  reloadData];
}

-(NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    ForecastItemTableViewCell *itemCell = [tableView dequeueReusableCellWithIdentifier:@"ForecastItemTableViewCell" forIndexPath:indexPath];
    if (!itemCell) {
        itemCell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
        WeatherData *data = self.weatherData[indexPath.row +1];
        if (data) {
            itemCell.weekdayLabel.text = data.date;
            itemCell.weatherLabel.text = data.weather;
            itemCell.weatherImageView.image = [UIImage imageNamed:[WeatherTool getWeatherPicWithWeatherName:data.weather]];
        }
    }
    return  itemCell;

}
@end
