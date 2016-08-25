//
//  ViewController.m
//  BOBUtils
//
//  Created by beyondsoft-聂小波 on 16/8/15.
//  Copyright © 2016年 NieXiaobo. All rights reserved.
//

#import "ViewController.h"
#import "BOBsKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *testButton = [[UIButton alloc]init];
    testButton.title = @"按钮标题";
    
    NSLog(@"---->%@<----->%@<---",testButton.title,  testButton.titleLabel.text);
    
    NSMutableDictionary *temp = [[NSMutableDictionary alloc]init];
    [temp addObject:@[@"按钮标题"] forKey:@"keys"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
