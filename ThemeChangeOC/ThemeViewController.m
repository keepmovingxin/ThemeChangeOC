//
//  ThemeViewController.m
//  ThemeChangeOC
//
//  Created by KP_LGX on 16/3/31.
//  Copyright © 2016年 KP_LGX. All rights reserved.
//

#import "ThemeViewController.h"
#import "themeConst.h"
#import "ThemeUtil.h"
#import "ThemeLabel.h"
#import "ThemeButton.h"
#import "ThemeImageView.h"
#import "ThemeManager.h"

@interface ThemeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,retain) NSArray *themeArr;
@property (nonatomic,strong) UITableView *themeTableView;

@end

@implementation ThemeViewController
@synthesize themeArr,themeTableView;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.themeArr = [[ThemeManager shareInstance].themesPlist allKeys];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavigationItems];
    self.themeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    themeTableView.delegate = self;
    themeTableView.dataSource = self;
    themeTableView.backgroundColor = [UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f];
    [self.view addSubview:themeTableView];
}

#pragma mark - Create UI
- (void)initNavigationItems {
    ThemeLabel *titleLabel = [ThemeUtil createLabel:kNavigationBarTitleLabel];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    titleLabel.text = @"主题列表";
    titleLabel.frame = CGRectMake(0, 0, 200, 44);
    self.navigationItem.titleView = titleLabel;
    
    ThemeButton *backBtn = [ThemeUtil createButton:@"navigationbar_back.png"
                                       highlighted:@"navigationbar_back_highlighted.png"];
    backBtn.frame = CGRectMake(0, 0, 30, 30);
    [backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}

#pragma mark - Button Actions
- (void)backBtnClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [themeArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"themeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        UILabel *textLabel = [ThemeUtil createLabel:kThemeListLabel];
        textLabel.frame = CGRectMake(10, 10, self.view.frame.size.width - 120,30);
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.font = [UIFont boldSystemFontOfSize:16.0f];
        textLabel.tag = 101;
        [cell.contentView addSubview:textLabel];
    }
    UILabel *textLabel = (UILabel *)[cell.contentView viewWithTag:101];
    NSString *theme = themeArr[indexPath.row];
    textLabel.text = theme;
    
    NSString *themeName = [ThemeManager shareInstance].themeName;
    if (themeName == nil) {
        themeName = @"默认";
    }
    if ([themeName isEqualToString:theme]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

#pragma mark - UITableView Delegata
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *themeName = [themeArr objectAtIndex:indexPath.row];
    if ([themeName isEqualToString:@"默认"]) {
        themeName = nil;
    }
    
    // 保存当前选择的主题到本地
    [[NSUserDefaults standardUserDefaults] setObject:themeName forKey:kThemeName];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [ThemeManager shareInstance].themeName = themeName;
    
    // 发送一个kThemeDidChangeNotification的通知，切换主题
    [[NSNotificationCenter defaultCenter] postNotificationName:kThemeDidChangeNotification object:themeName];
    [tableView reloadData];
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
