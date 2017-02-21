//
//  ViewController.m
//  ObjectiveTableView
//
//  Created by macPro on 2017/2/10.
//  Copyright © 2017年 macPro. All rights reserved.
//

#import "ViewController.h"
#import "ObjcTableViewCell.h"
#import "TransformManager.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *_dataSource;
    UIView *_glView;
    UILabel  *_lable;
    
    UIImageView *_backgroundImage;
}
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _backgroundImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"a.jpeg"]];
//    _backgroundImage.layer.doubleSided = NO;
    _backgroundImage.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_backgroundImage];
    
    
    
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    //旋转
    
    [TransformManager rotationView:_backgroundImage angle:M_PI x:0 y:1 z:0 timeInterval:1 andBlock:^{
        
        [TransformManager gradualView:_backgroundImage alpha:0.0 timeInterval:0.3 andBlock:^{
            self.tableView.hidden = NO;
            [_backgroundImage removeFromSuperview];
            [self initialSubview];
        }];
        
    }];
}

- (void)initialSubview{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-60) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIButton *b = [UIButton buttonWithType:UIButtonTypeSystem];
    b.frame = CGRectMake(100, self.view.frame.size.height-110, (self.view.frame.size.width-200), 30);
    b.layer.cornerRadius = b.frame.size.height/2;
    b.layer.masksToBounds = YES;
    [b addTarget:self action:@selector(anim:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    _glView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 3*b.frame.size.width, b.frame.size.height)];
    _glView.userInteractionEnabled = NO;
    
    //渐变图层
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.colors = @[(__bridge id)[UIColor blueColor].CGColor,(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor yellowColor].CGColor];
    gl.locations = @[@0,@0.5,@1];
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(1, 0);
    gl.frame = CGRectMake(0, 0, _glView.frame.size.width, _glView.frame.size.height);
    [_glView.layer addSublayer:gl];
    [b addSubview:_glView];
    
    //lable
    _lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, b.frame.size.width, b.frame.size.height)];
    _lable.text = @"开启";
    _lable.textColor = [UIColor whiteColor];
    _lable.backgroundColor = [UIColor clearColor];
    _lable.textAlignment = NSTextAlignmentCenter;
    [b addSubview:_lable];
    
    [self.view addSubview:b];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    //拟获取到的数据
    _dataSource = @[@"1",@"2",@"3",@"4",@"5"];
    [self.tableView registerClass:[ObjcTableViewCell class] forCellReuseIdentifier:@"ObjcTableViewCell"];

}

- (void)anim:(UIButton *)b{
    
    if (_glView.frame.origin.x == 0) {
        //颜色渐变
        [TransformManager transitionView:_glView x:-2*b.frame.size.width y:0 z:0 timeInterval:0.05 andBlock:^{
            //缩放
            [TransformManager scaleView:_lable x:0.05 y:0.05 z:1 timeInterval:0.05 andBlock:^{
                _lable.text = @"关闭";
                _lable.layer.transform = CATransform3DMakeScale(1, 1, 1);
            }];
        }];

    }else{
        //颜色渐变
        [TransformManager transitionView:_glView x:0 y:0 z:0 timeInterval:0.05 andBlock:^{
            //缩放
            [TransformManager scaleView:_lable x:0.05 y:0.05 z:1 timeInterval:0.05 andBlock:^{
                _lable.text = @"关闭";
                _lable.layer.transform = CATransform3DMakeScale(1, 1, 1);
            }];

            
        }];
        
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ObjcTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ObjcTableViewCell"];
    
    //将数据传输给cell自行设置自身样式
    cell.data = _dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ObjcTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //点击cell，将操作通过block传给cell，由cell做主体
    [cell clickCellSection:indexPath.section row:indexPath.row block:^(id data) {
        //执行跳转
        UIViewController *vc = [[UIViewController alloc]init];
        vc.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    
}




@end
