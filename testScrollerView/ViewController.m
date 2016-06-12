//
//  ViewController.m
//  testScrollerView
//
//  Created by 薛焱 on 16/6/12.
//  Copyright © 2016年 薛焱. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"

@interface ViewController ()
@property (strong, nonatomic)HeaderView *headerView ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _headerView = [[HeaderView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 200)];
    [self.view addSubview:_headerView];
    _headerView.headerScrollView.contentOffset = CGPointMake(100, 0);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
