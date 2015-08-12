//
//  IndexTableViewCell.h
//  Anything
//
//  Created by 洪浩 on 15/8/7.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndexTableViewCell : UITableViewCell<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSArray *Index;

@end
