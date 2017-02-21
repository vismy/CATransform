//
//  ObjcTableViewCell.m
//  ObjectiveTableView
//
//  Created by macPro on 2017/2/10.
//  Copyright © 2017年 macPro. All rights reserved.
//

#import "ObjcTableViewCell.h"

@implementation ObjcTableViewCell

- (void)setData:(id)data{
    _data = data;
    self.textLabel.text = data;
}

- (void)clickCellSection:(NSInteger)section row:(NSInteger)row block:(cellDone)block{
    NSLog(@"click cell section:%lu row:%lu",section,row);
    block(nil);
    
}


@end
