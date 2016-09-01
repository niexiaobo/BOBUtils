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
    
    NSArray *sortArray = @[@"A2",@"A1",@"c3",@"d4",@"b",@"d12"];
    NSSet *sortSet = [NSSet setWithArray:sortArray];
    NSSet *set = [NSSet setWithArray:sortArray];
    
    NSArray *sortDesc = @[[[NSSortDescriptor alloc] initWithKey:nil ascending:YES]];
    
    NSArray *sortSetArray = [set sortedArrayUsingDescriptors:sortDesc];
     NSLog(@"--sortSet-->%@<----<---",[sortSet allObjects]);
     NSLog(@"---sortSetArray->%@<----<---",sortSetArray);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
