//
//  ViewController.m
//  ThemeChangeOC
//
//  Created by KP_LGX on 16/3/31.
//  Copyright © 2016年 KP_LGX. All rights reserved.
//

#import "ViewController.h"
#import "themeConst.h"
#import "HomeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)didClickThemeButton:(id)sender {
    // enter demo
    HomeViewController *homeCtrl = [[HomeViewController alloc] init];
    UINavigationController *homeNavCtrl = [[UINavigationController alloc] initWithRootViewController:homeCtrl];
    [self presentViewController:homeNavCtrl animated:YES completion:^{
        NSLog(@"enter home~");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
