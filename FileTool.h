//
//  FileTool.h
//  Anything
//
//  Created by 洪浩 on 15/8/4.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"
@interface FileTool : NSObject
+(void)writeWeatherToFile:(Weather *)weather withCity:(NSString *)city;
+(Weather *)readWeatherFromFileWithCity:(NSString *)city;
+(void)writeCitysToFile:(NSMutableArray *)citys;
+(NSMutableArray *)readCitysFromFile;
@end
