//
//  ViewController.m
//  LearnSiriShortcut
//
//  Created by loyinglin on 2018/9/18.
//  Copyright © 2018年 loyinglin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"report siri" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(reportSiriShortCut) forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    btn.center = CGPointMake(200, 200);
    [self.view addSubview:btn];
}


- (void)reportSiriShortCut {
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:@"loying.LearnSiriShortcut.type"];
    userActivity.eligibleForSearch = YES;
    if (@available(iOS 12.0, *))
    {
        userActivity.eligibleForPrediction = YES;
    }
    userActivity.title = @"作品播放";
    userActivity.userInfo = @{@"testKey" : @"testValue"};
    //    userActivity.sugge = @"来全民K歌发现好听的歌";
    [userActivity becomeCurrent];
    
}

@end
