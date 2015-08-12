//
//  Results.h
//  Anything
//
//  Created by 洪浩 on 15/7/28.
//  Copyright © 2015年 洪浩. All rights reserved.
//
#import "JSONModel.h"
#import "WeatherIndex.h"
#import "WeatherData.h"
@protocol Results
@end

@interface Results : JSONModel

@property(nonatomic,copy)NSString *currentCity;
@property(nonatomic,assign)int pm25;
@property(nonatomic,strong)NSArray<WeatherIndex>  *index;
@property(nonatomic,strong)NSArray<WeatherData> *weather_data;

@end

