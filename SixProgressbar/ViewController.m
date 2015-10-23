//
//  ViewController.m
//  SixProgressbar
//
//  Created by edutech on 15/10/22.
//  Copyright © 2015年 luojie. All rights reserved.
//

#import "ViewController.h"
#import "SixPB.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initSix];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initSix
{
    SixPB *sixpb1 = [[SixPB alloc] initSixPB:CGRectMake(100, 100, 100, 100) Range:1.0];
    [self.view addSubview:sixpb1];
    
    SixPB *sixpb2 = [[SixPB alloc] initSixPB:CGRectMake(100, 250, 100, 100) Range:0.8];
    [self.view addSubview:sixpb2];
    
    SixPB *sixpb3 = [[SixPB alloc] initSixPB:CGRectMake(100, 400, 100, 100) Range:0.5];
    [self.view addSubview:sixpb3];
    
    SixPB *sixpb4 = [[SixPB alloc] initSixPB:CGRectMake(100, 550, 100, 100) Range:0.3];
    [self.view addSubview:sixpb4];
}
@end
