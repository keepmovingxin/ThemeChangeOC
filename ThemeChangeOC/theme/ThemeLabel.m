//
//  ThemeLabel.m
//  ThemeChangeOC
//
//  Created by KP_LGX on 16/3/31.
//  Copyright © 2016年 KP_LGX. All rights reserved.
//

#import "ThemeManager.h"
#import "ThemeLabel.h"

@implementation ThemeLabel

- (id)init {
    self = [super init];
    if (self != nil) {
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(themeNotification:)
         name:kThemeDidChangeNotification object:nil];
    }
    return self;
}

- (id)initWithColorName:(NSString *)colorName {
    self = [self init];
    if (self != nil) {
        self.colorName = colorName;
    }
    return self;
}

#pragma mark - setter
- (void)setColorName:(NSString *)colorName {
    if (_colorName != colorName) {
        _colorName = [colorName copy];
    }
    [self setColor];
}

- (void)setColor {
    UIColor *textColor = [[ThemeManager shareInstance] getColorWithName:_colorName];
    self.textColor = textColor;
}

#pragma mark - NSNotification Actions
- (void)themeNotification:(NSNotification *)notification {
    [self setColor];
}

#pragma mark - Memery Manager
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
