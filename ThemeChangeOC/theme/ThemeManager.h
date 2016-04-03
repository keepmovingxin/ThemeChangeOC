//
//  ThemeManager.h
//  ThemeChangeOC
//  主题管理类:单例，用于主题管理和本地存储
//  Created by KP_LGX on 16/3/31.
//  Copyright © 2016年 KP_LGX. All rights reserved.
//

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
