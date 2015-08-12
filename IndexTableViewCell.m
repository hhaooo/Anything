//
//  IndexTableViewCell.m
//  Anything
//
//  Created by 洪浩 on 15/8/7.
//  Copyright © 2015年 洪浩. All rights reserved.
//

#import "IndexTableViewCell.h"
#import "IndexItemTableViewCell.h"
#import "WeatherIndex.h"
#import "WeatherTool.h"

@implementation IndexTableViewCell

- (void)awakeFromNib {
    self.tableView.delegate= self;
    self.tableView.dataSource = self;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setIndex:(NSArray *)Index{
 
    _Index = Index;
    [self.tableView reloadData];
}

-(NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  4;
//    return  self.Index.count;
}

-(CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    return 136;
}

-(nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    IndexItemTableViewCell *itemCell = [tableView dequeueReusableCellWithIdentifier:@"IndexItemTableViewCell"];
    if (!itemCell) {
        itemCell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
        WeatherIndex *index = self.Index[indexPath.row];
        if (index) {
            itemCell.indexTitleLabel.text = index.title;
            itemCell.indexDegreeLabel.text = index.zs;
            itemCell.indexDescLabel.text = index.des;
            itemCell.indexPicImageView.image = [UIImage imageNamed:[WeatherTool getIndexPicWithRow:indexPath.row]];
        }
        
    }
    
    return itemCell;
    
}
@end
