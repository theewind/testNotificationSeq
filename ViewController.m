//
//  ViewController.m
//  testNotificationSeq
//
//  Created by LiYunFeng on 14-11-2.
//  Copyright (c) 2014年 sogou. All rights reserved.
//

#import "ViewController.h"
#import "UITestLable1.h"

extern NSString *const changeLableTextNofitication;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[[UIImage imageNamed:@"button1"] stretchableImageWithLeftCapWidth:10 topCapHeight:10]  forState:UIControlStateNormal];
    [button setBackgroundImage:[[UIImage imageNamed:@"button2"] stretchableImageWithLeftCapWidth:10 topCapHeight:10] forState:UIControlStateHighlighted];
    button.frame = CGRectMake(20, 20, 200, 40);
    [button setTitle:@"notification" forState:UIControlStateNormal];
    [button setTitle:@"notification" forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(notification) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    CGFloat startY = 100;
    [self addLabelWithFrame:CGRectMake(20, startY, 200, 40) withIndex:1];
    startY += 50;
    [self addLabelWithFrame:CGRectMake(20, startY, 200, 40) withIndex:2];
    startY += 50;
    [self addLabelWithFrame:CGRectMake(20, startY, 200, 40) withIndex:3];
    startY += 50;
    [self addLabelWithFrame:CGRectMake(20, startY, 200, 40) withIndex:4];
    startY += 50;
    [self addLabelWithFrame:CGRectMake(20, startY, 200, 40) withIndex:5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)notification
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:changeLableTextNofitication object:nil];
    });
}

- (void)addLabelWithFrame:(CGRect)frame withIndex:(NSInteger)index
{
    NSString *className = [NSString stringWithFormat:@"UITestLable%ld", index];
    UILabel *lable = [[NSClassFromString(className) alloc] initWithFrame:frame];
    lable.backgroundColor = [UIColor grayColor];
    [self.view addSubview:lable];
    lable.text = NSStringFromCGRect(frame);
}

@end
