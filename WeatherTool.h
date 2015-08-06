//
//  WeatherTool.h
//  Anything
//
//  Created by 洪浩 on 15/7/28.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#import "JSONModel.h"

@interface WeatherTool : JSONModel

+(NSString *)getBackgroundImageWithWeatherName:(NSString *)weatherName;
+(NSString *)getWeatherPicWithWeatherName:(NSString *)weatherName;
+(NSString *)getIndexPicWithRow:(int)row;
+(NSString *)getPm25PicWithDegree:(int)degree;

@end
