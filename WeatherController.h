//
//  WeatherController.h
//  Anything
//
//  Created by 洪浩 on 15/7/24.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherController : UIViewController<UIPageViewControllerDataSource,UIPageViewControllerDelegate>


@property(nonatomic, strong) UIPageControl* pageControl;
@property(nonatomic, strong) UIPageViewController *pageController;
@property(nonatomic, strong) UIScrollView* scrollvoew;
@property(nonatomic, strong) UIView* upView;
@property(nonatomic, strong) NSMutableArray* viewControllers;
@property(nonatomic, strong) NSMutableArray* citys;
@property(nonatomic, assign) int curPage;
@property(nonatomic, assign) int totalPages;
@property(nonatomic,copy) NSString *cityName;


@end
