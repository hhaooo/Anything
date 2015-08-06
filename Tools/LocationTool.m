//
//  LocationTool.m
//  Anything
//
//  Created by 洪浩 on 15/7/27.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#import "LocationTool.h"
#define kSystemVersion  [[[UIDevice currentDevice] systemVersion] floatValue]

@interface LocationTool ()

@end

@implementation LocationTool

-(void)startLocationManager{
    
    self.locationManager = [[CLLocationManager alloc]init];
    if ([CLLocationManager locationServicesEnabled]) {
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
        if (kSystemVersion >= 8.0) {
            [self.locationManager requestAlwaysAuthorization];
        }
        [self.locationManager startUpdatingLocation];
        [self performSelector:@selector(didTimeOut:) withObject:nil afterDelay:10];
    }
    
}

-(void)stopLocationManager{
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(didTimeOut:) object:nil];
    if (self.locationManager) {
        [self.locationManager stopUpdatingLocation];
        self.locationManager.delegate = nil;
    }
}

-(void)didTimeOut:(id)obj{
    
    [self stopLocationManager];
    [self.delegate locationFailed];
}

-(void)locationManager:(nonnull CLLocationManager *)manager didFailWithError:(nonnull NSError *)error{
    
    [self stopLocationManager];
    [self.delegate locationFailed];
}

-(void)locationManager:(nonnull CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations{
    
    [self stopLocationManager];
    [self.delegate locationFailed];
}

@end
