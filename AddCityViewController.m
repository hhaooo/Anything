//
//  AddCityViewController.m
//  Anything
//
//  Created by 洪浩 on 15/8/4.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#import "AddCityViewController.h"

@interface AddCityViewController ()

@end

@implementation AddCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureData];
    [self configureView];
    // Do any additional setup after loading the view.
}

-(void)configureData{
    
    if (self.displayType == kDisplayProvince) {
        NSString* addressPath = [[NSBundle mainBundle]pathForResource:@"address" ofType:@"plist"];
        NSMutableDictionary* dict = [[NSMutableDictionary alloc]initWithContentsOfFile:addressPath];
        self.provinces = [dict objectForKey:@"address"];
    }
    self.isSubmit = FALSE;
}

-(void)configureView{
    
    if (self.displayType == kDisplayProvince) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(Cancel)];
    }
    if (self.displayType == kDisplayCity) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(Submit)];
    }
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

-(void)Cancel{
        [self dismissViewControllerAnimated:TRUE completion:nil];
}

-(void)Submit{
    
    if (self.isSubmit) {
        NSMutableArray* citys = [FileTool readCitysFromFile];
        [citys addObject:self.selectedCity];
        [FileTool writeCitysToFile:citys];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"CityChangeNotification" object:nil];
        [self dismissViewControllerAnimated:TRUE completion:nil];
    }else{
        [self dismissViewControllerAnimated:TRUE completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    static NSString* ID = @"cityCell";
    UITableViewCell* cell= [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (self.displayType == kDisplayProvince) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    if (self.displayType == kDisplayProvince) {
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        NSDictionary* provinces = self.provinces[indexPath.row];
        NSString* provinceName = [provinces objectForKey:@"name"];
        cell.textLabel.text = provinceName;
    }else if (self.displayType == kDisplayCity){
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        NSDictionary *city = self.citys[indexPath.row];
        NSString *cityName = [city objectForKey:@"name"];
        cell.textLabel.text= cityName;
        if ([self.selectedCity isEqualToString:cityName]) {
            cell.imageView.image = [UIImage imageNamed:@"checked"];
            self.isSubmit = TRUE;
        }else{
            cell.imageView.image = [UIImage imageNamed:@"unchecked"];
        }
    }
    else{
        cell.textLabel.text = self.areas[indexPath.row];
    }
    return  cell;

}

-(void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    if (self.displayType == kDisplayProvince) {
        NSDictionary* province = self.provinces[indexPath.row];
        NSArray* citys = [province objectForKey:@"sub"];
        AddCityViewController* cityCon = [[AddCityViewController alloc]init];
        cityCon.displayType = kDisplayCity;
        cityCon.citys = citys;
        [self.navigationController pushViewController:cityCon animated:TRUE];
    }else if(self.displayType == kDisplayCity){
        NSDictionary* city = self.citys[indexPath.row];
        self.selectedCity = [city objectForKey:@"name"];
        [self.tableView reloadData];
    }
}

-(NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (self.displayType == kDisplayProvince) {
        return self.provinces.count;
    }if (self.displayType == kDisplayCity) {
        return self.citys.count;
    }return self.areas.count;
    
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
