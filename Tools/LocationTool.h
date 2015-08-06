//
//  LocationTool.h
//  Anything
//
//  Created by 洪浩 on 15/7/27.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@protocol LocationToolDelegate <NSObject>
-(void)locationReceived:(CLLocation*)location;
-(void)locationFailed;
@end

@interface LocationTool : NSObject<CLLocationManagerDelegate>
@property(nonatomic,strong)CLLocationManager *locationManager;
@property(nonatomic,strong)CLLocation *location;

-(void)startLocationManager;

@property(nonatomic,weak)id<LocationToolDelegate> delegate;

@end
