//
//  ObjcTableViewCell.h
//  ObjectiveTableView
//
//  Created by macPro on 2017/2/10.
//  Copyright © 2017年 macPro. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^cellDone)(id data);

@interface ObjcTableViewCell : UITableViewCell

@property(nonatomic,strong)id data;

- (void)clickCellSection:(NSInteger)section row:(NSInteger)row block:(cellDone)block;

@end
