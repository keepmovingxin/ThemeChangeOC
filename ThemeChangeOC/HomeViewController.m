//
//  HomeViewController.m
//  ThemeChangeOC
//
//  Created by KP_LGX on 16/3/31.
//  Copyright © 2016年 KP_LGX. All rights reserved.
//

#import "HomeViewController.h"
#import "themeConst.h"
#import "ThemeUtil.h"
#import "ThemeLabel.h"
#import "ThemeButton.h"
#import "ThemeImageView.h"
#import "ThemeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initNavigationItems];
    [self initSubViews];
    
}

#pragma mark - Create UI
- (void)initNavigationItems {
    ThemeImageView *titleView = [ThemeUtil createImageView:@"title_logo.png"];
    titleView.frame = CGRectMake(0, 0, 70, 44);
    titleView.contentMode = UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView = titleView;
    
    ThemeButton *backBtn = [ThemeUtil createButton:@"navigationbar_back.png"
                                   highlighted:@"navigationbar_back_highlighted.png"];
    backBtn.frame = CGRectMake(0, 0, 30, 30);
    [backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)initSubViews {
    ThemeLabel *textLabel = [ThemeUtil createLabel:kThemeListLabel];
    textLabel.frame = CGRectMake(ScreenWidth/2-120, 100, 240, 30);
    textLabel.font = [UIFont systemFontOfSize:14.0f];
    textLabel.text = @"这是一个测试主题切换的DEMO~";
    [self.view addSubview:textLabel];
    
    ThemeImageView *iconView = [ThemeUtil createImageView:@"background.png"];
    iconView.frame = CGRectMake(ScreenWidth/2-85/2, 170, 85, 85);
    iconView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:iconView];
    
    ThemeButton *enterBtn = [ThemeUtil createButtonWithBackground:@"button_background.png" backgroundHighlighted:@"button_delete_background.png"];
    enterBtn.frame = CGRectMake(ScreenWidth/2-30, 300, 60, 30);
    enterBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    enterBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [enterBtn setTitle:@"切换主题" forState:UIControlStateNormal];
    [enterBtn addTarget:self action:@selector(enterBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:enterBtn];;
}

#pragma mark - Button Actions
- (void)backBtnClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"back first view~");
    }];
}

- (void)enterBtnClick:(id)sender {
    ThemeViewController *themeViewController = [[ThemeViewController alloc]init];
    [self.navigationController pushViewController:themeViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
