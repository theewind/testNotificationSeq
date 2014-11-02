//
//  UITestLable1.m
//  testNotificationSeq
//
//  Created by LiYunFeng on 14-11-2.
//  Copyright (c) 2014年 sogou. All rights reserved.
//

#import "UITestLable1.h"

NSString *const changeLableTextNofitication = @"changeLableTextNofitication";

@implementation UITestLable1

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:changeLableTextNofitication object:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addNotification];
    }
    
    return self;
}

- (void)addNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLableText) name:changeLableTextNofitication object:nil];
}

- (void)changeLableText
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.text = @"1";
        self.backgroundColor = [UIColor redColor];
    });
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UITestLable2

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:changeLableTextNofitication object:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addNotification];
    }
    
    return self;
}

- (void)addNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLableText) name:changeLableTextNofitication object:nil];
}

- (void)changeLableText
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.text = @"2";
        self.backgroundColor = [UIColor yellowColor];
    });
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UITestLable3

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:changeLableTextNofitication object:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addNotification];
    }
    
    return self;
}

- (void)addNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLableText) name:changeLableTextNofitication object:nil];
}

- (void)changeLableText
{
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        dispatch_async(dispatch_get_main_queue(), ^{
            self.text = @"3";
            self.backgroundColor = [UIColor orangeColor];
        });
//    });
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UITestLable4

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:changeLableTextNofitication object:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addNotification];
    }
    
    return self;
}
- (void)addNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLableText) name:changeLableTextNofitication object:nil];
}

- (void)changeLableText
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.text = @"4";
        self.backgroundColor = [UIColor blueColor];
    });
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UITestLable5

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:changeLableTextNofitication object:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addNotification];
    }
    
    return self;
}

- (void)addNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLableText) name:changeLableTextNofitication object:nil];
}

- (void)changeLableText
{
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            self.text = @"555555";
            self.backgroundColor = [UIColor yellowColor];
        });
        sleep(1);
        dispatch_async(dispatch_get_main_queue(), ^{
            self.text = @"5";
            self.backgroundColor = [UIColor greenColor];
        });
//    });
}

@end


////////////////////////////////////////////////////////////////////////////////////////////////


