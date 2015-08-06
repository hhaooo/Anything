//
//  WeatherData.h
//  Anything
//
//  Created by 洪浩 on 15/7/28.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#import "JSONModel.h"
@protocol WeatherData
@end

@interface WeatherData : JSONModel

@property(nonatomic,copy)NSString *date;
@property(nonatomic,copy)NSString *dayPictureUrl;
@property(nonatomic,copy)NSString *nightPictureUrl;
@property(nonatomic,copy)NSString *weather;
@property(nonatomic,copy)NSString *wind;
@property(nonatomic,copy)NSString *temperature;

@end
