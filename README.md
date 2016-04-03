iOS 利用通知NSNotificationCenter和NSUserDefaults实现主题切换

1.效果图：
<img src="https://github.com/liu1451182540/ThemeChangeOC/blob/master/demo.gif?2" alt="ThemeChange Screenshot" width="320" height="568" />

2.实现思路：
·首先创建一个单例类用于管理主题 ThemeManager：包括主题配置文件的获取及一些操作方法
·创建自定义ThemeLabel、 ThemeButton、 ThemeImageView用于监听切换主题通知，切换对应的图片和字体颜色
·切换主题的时用 NSUserDefaults保存主题名称到本地， NSNotificationCenter 发送一个kThemeDidChangeNotification的通知切换主题

·根据不同的主题在fontColor.plist Label字体颜色配置， theme.plist文件配置图片文件夹路径
·点击切换主题Cell -> 发出切换主题的通知 -> 响应通知方法重新设置Label字体颜色、Button图片、ImageView的图片

3.核心代码：
· ThemeManager  主题管理类:单例，用于主题管理和本地存储
· ThemeLabel 自定义主题Button 可根据主题切换图片和背景图片
· ThemeButton 自定义主题Label 可根据主题切换图片

· ThemeImageView 自定义主题ImageView 可根据主题切换字体颜色
· ThemeUtil  主题UI创建工具类:封装主题Label、Button、ImageView工厂创建方法

·ThemeManager 管理方法：

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define kThemeName @"kThemeName"
#define kThemeDidChangeNotification @"kThemeDidChangeNotification"

@interface ThemeManager : NSObject

@property(nonatomic,retain)NSString *themeName;
//主题配置 theme.plist文件
@property(nonatomic,retain)NSDictionary *themesPlist;
// Label字体颜色配置 fontColor.plist文件
@property(nonatomic,retain)NSDictionary *fontColorPlist;
+(ThemeManager *)shareInstance;
-(UIImage *)getThemeImage:(NSString *)imageName;
-(UIColor *)getColorWithName:(NSString *)name;
@end

·ThemeLabel、 ThemeButton、 ThemeImageView 监听通知：

[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];

ThemeLabel：

- (void)themeNotification:(NSNotification *)notification {
    [self setColor];
}

ThemeButton、 ThemeImageView：

- (void)themeNotification:(NSNotification *)notification {
    [self loadThemeImage];
}

·点击切换主题Cell方法：
// 保存当前选择的主题到本地
[[NSUserDefaults standardUserDefaults] setObject:themeName forKey:kThemeName];
[[NSUserDefaults standardUserDefaults] synchronize];

[ThemeManager shareInstance].themeName = themeName;
// 发送一个kThemeDidChangeNotification的通知，切换主题
[[NSNotificationCenter defaultCenter] postNotificationName:kThemeDidChangeNotification object:themeName];
