//
//  HeaderTableViewCell.m
//  Anything
//
//  Created by 洪浩 on 15/7/28.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#import "HeaderTableViewCell.h"
#import "WeatherViewController.h"
#import "WeatherTool.h"

@implementation HeaderTableViewCell

- (void)awakeFromNib {
    self.contentView.backgroundColor = [UIColor yellowColor];
    // Initialization code
}
//
//
//-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
//    
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (!self) {
////        self = [[HeaderTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"123"];
//    }
//    return self;
//}
//+(instancetype)instance{
//    
//    HeaderTableViewCell *cell;
////    UIStoryboard* mainStoryBorad = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    return cell;
//}
-(void)setWeather:(Weather *)weather{
    _weather = weather;
    if (weather) {
        Results *result = weather.results[0];
        WeatherData *weatherData = result.weather_data[0];
        self.weatherImageView.image = [UIImage imageNamed:[WeatherTool getWeatherPicWithWeatherName:weatherData.weather]];
        self.weatherLabel.text = weatherData.weather;
        self.pm25ImageView.image = [UIImage imageNamed:[WeatherTool getPm25PicWithDegree:result.pm25]];
        self.pm25Label.text = [NSString stringWithFormat:@"%d",result.pm25];
        self.tempRangeLabel.text = weatherData.temperature;
        self.tempLabel.text =  [self extractTempFromData:weatherData.date];
        self.updateDateLabel.text = weather.date;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(NSString *)extractTempFromData:(NSString *)data{
    //周三(今天, 实时：24℃)
    NSRange startRange = [data rangeOfString:@"："];
    NSRange endRange = [data rangeOfString:@")"];
    if (startRange.length>0) {
        NSRange subStringRange = NSMakeRange(startRange.location +1, endRange.location -startRange.location-1) ;
        return [data substringWithRange:subStringRange];
    }
    return nil;
}

@end
