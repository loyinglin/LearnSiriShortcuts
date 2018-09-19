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
    [btn addTarget:self action:@selector(reportSiriShortcuts) forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    btn.center = CGPointMake(200, 200);
    [self.view addSubview:btn];
}


- (void)reportSiriShortcuts {
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:@"loying.LearnSiriShortcut.type"];
    userActivity.eligibleForSearch = YES;
    if (@available(iOS 12.0, *)) // 如果要支持老版本，加上判断
    {
        userActivity.eligibleForPrediction = YES;
    }
    userActivity.title = @"测试标题";
    userActivity.userInfo = @{@"testKey" : @"testValue"};
    self.userActivity = userActivity;
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"已通知siri" message:userActivity.title preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addAction:sureAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
