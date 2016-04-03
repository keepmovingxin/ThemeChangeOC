//
//  ThemeManager.m
//  ThemeChangeOC
//
//  Created by KP_LGX on 16/3/31.
//  Copyright © 2016年 KP_LGX. All rights reserved.
//

#import "ThemeManager.h"

static ThemeManager *sigletonInstance = nil;

@implementation ThemeManager

+(ThemeManager *)shareInstance{
    if (sigletonInstance == nil) {
        @synchronized(self){
            sigletonInstance = [[ThemeManager alloc]init];
        }
    }
    return sigletonInstance;
}

-(id)init {
    self = [super init];
    if (self) {
        NSString *themePath = [[NSBundle mainBundle] pathForResource:@"theme" ofType:@"plist"];
        self.themesPlist = [NSDictionary dictionaryWithContentsOfFile:themePath];
        self.themeName = nil;
    }
    return self;
}

-(void)setThemeName:(NSString *)themeName{
    if (_themeName != themeName) {
        _themeName = [themeName copy];
    }
    
    NSString *themeDir = [self getThemePath];
    NSString *fontColorPath = [themeDir stringByAppendingPathComponent:@"fontColor.plist"];
    self.fontColorPlist = [NSDictionary dictionaryWithContentsOfFile:fontColorPath];
}

- (NSString *)getThemePath{
    if (self.themeName == nil) {
        NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
        return resourcePath;
    }
    
    // eg:Skins/blue
    NSString *themePath = [self.themesPlist objectForKey:_themeName];
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString *path = [resourcePath stringByAppendingPathComponent:themePath];
    
    return path;
}

- (UIImage *)getThemeImage:(NSString *)imageName{
    if (imageName.length == 0) {
        return nil;
    }
    NSString *themePath = [self getThemePath];
    NSString *imagePath = [themePath stringByAppendingPathComponent:imageName];
    
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    
    return image;
}

- (UIColor *)getColorWithName:(NSString *)name{
    if (name.length == 0) {
        return nil;
    }
    NSString *rgb = [_fontColorPlist objectForKey:name];
    NSArray *rgbs = [rgb componentsSeparatedByString:@","];
    if (rgbs.count == 3) {
        float r = [rgbs[0] floatValue];
        float g = [rgbs[1] floatValue];
        float b = [rgbs[2] floatValue];
        UIColor *color = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
        return color;
    }
    return nil;
}

#pragma mark - sigleton setting
+ (id)allocWithZone:(NSZone *)zone{
    @synchronized(self){
        if (sigletonInstance == nil) {
            sigletonInstance = [super allocWithZone:zone];
        }
    }
    return sigletonInstance;
}

+ (id)copyWithZone:(NSZone *)zone{
    return self;
}

@end
