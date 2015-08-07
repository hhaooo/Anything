//
//  WeatherController.m
//  Anything
//
//  Created by 洪浩 on 15/7/24.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#include "AddCityViewController.h"
#import "WeatherController.h"
#import "FileTool.h"
#import "WeatherViewController.h"
@interface WeatherController ()

@end

@implementation WeatherController

- (void)viewDidLoad {

    [self configureData];
    [self configureViews];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(addCity) name:@"CityChangedNotification" object:nil];
    // Do any additional setup after loading the view.
}


-(void)configureData{
    
    self.citys = [FileTool readCitysFromFile];//initset
    self.totalPages = self.citys.count + 1;
    self.curPage = 0;
    self.viewControllers = [NSMutableArray array];
    UIStoryboard* mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    WeatherViewController *defaultViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"weatherViewController"];
    defaultViewController.page = 0;
    [self.viewControllers addObject:defaultViewController];
    for (int i =0; i< self.citys.count; i++) {
        WeatherViewController *tempVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"weatherViewController"];
        tempVC.cityName = self.citys[i];
        tempVC.page = i + 1;
//        tempVC.tableView = [[UITableView alloc]init];
        [self.viewControllers addObject:tempVC];
//        [self.view addSubview:tempVC.view];
    }
}

-(void)configureViews{
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(40, 0, 40, 40)];
    self.pageControl.center = CGPointMake(self.navigationController.navigationBar.bounds.size.width / 2.0, self.navigationController.navigationBar.bounds.size.height / 2.0);
    [self.pageControl addTarget:self action:@selector(pageSelected) forControlEvents:UIControlEventTouchUpInside];
    self.pageControl.numberOfPages = self.totalPages;
    self.pageControl.currentPage = self.curPage;
    self.navigationItem.titleView = self.pageControl;
    self.pageControl.pageIndicatorTintColor = [UIColor redColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"gear"] style:UIBarButtonItemStyleDone target:self action:@selector(editCity)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"plus"] style:UIBarButtonItemStyleDone target:self action:@selector(addCity)];

//    // 设置UIPageViewController的配置项
    NSDictionary *options =[NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin] forKey: UIPageViewControllerOptionSpineLocationKey];

//    // 实例化UIPageViewController对象，根据给定的属性
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options: options];
    
//    // 设置UIPageViewController对象的代理
    self.pageController.dataSource = self;
    
//    // 定义“这本书”的尺寸
    [[self.pageController view] setFrame:[[self view] bounds]];
    NSArray *viewControllerArray =[NSArray arrayWithObjects:self.viewControllers.firstObject, nil];
    [self.pageController setViewControllers:viewControllerArray
                              direction:UIPageViewControllerNavigationDirectionForward
                               animated:NO
                             completion:nil];
    // 在页面上，显示UIPageViewController对象的View
    [self addChildViewController:self.pageController];
    [self.view addSubview:self.pageController.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSLog(@"after");
    self.curPage = ((WeatherViewController *)viewController).page;
    NSLog(@"%d",self.curPage);
    self.pageControl.currentPage = self.curPage;
    NSLog(@"%ld",(long)self.totalPages);
    if (self.curPage < self.totalPages - 1) {
        NSLog(@"inif");
        return self.viewControllers[self.curPage + 1];
    }else{
        return nil;
    }
    return nil;
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSLog(@"before");
    self.curPage = ((WeatherViewController *)viewController).page;
    NSLog(@"%d",self.curPage);
    self.pageControl.currentPage = self.curPage;
    NSLog(@"%ld",(long)self.totalPages);
    if (self.curPage > 0) {
        NSLog(@"inif");
        return self.viewControllers[self.curPage - 1];
    }else{
        return nil;
    }
    return  nil;
}

-(void)addCity{
    
    AddCityViewController* addCityVC = [[AddCityViewController alloc]init];
    addCityVC.displayType = kDisplayProvince;
    UINavigationController *naviVC = [[UINavigationController alloc]initWithRootViewController:addCityVC];
    [self presentViewController:naviVC animated:YES completion:nil];
}
-(void)editCity{
    
    
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"CityChangedNotification" object:nil];
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
