//
//  ThemeButton.m
//  ThemeChangeOC
//
//  Created by KP_LGX on 16/3/31.
//  Copyright © 2016年 KP_LGX. All rights reserved.
//

#import "ThemeManager.h"
#import "ThemeButton.h"

@implementation ThemeButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithImage:(NSString *)imageName highlighted:(NSString *)highlightImageName {
    self = [self init];
    if (self) {
        self.imageName = imageName;
        self.highlightImageName = highlightImageName;
    }
    return self;
}

- (id)initWithBackground:(NSString *)backgroundImageName
   highlightedBackground:(NSString *)backgroundHighlightImageName {
    self = [self init];
    if (self) {
        self.backgroundImageName = backgroundImageName;
        self.backgroundHighlightImageName = backgroundHighlightImageName;
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(themeNotification:)
         name:kThemeDidChangeNotification object:nil];
    }
    return self;
}

#pragma mark - NSNotification Actions
- (void)themeNotification:(NSNotification *)notification {
    [self loadThemeImage];
}

- (void)loadThemeImage {
    if (self.imageName == nil
        && self.highlightImageName == nil
        && self.backgroundImageName == nil
        && self.backgroundHighlightImageName == nil) {
        return;
    }
    
    ThemeManager *themeManager = [ThemeManager shareInstance];

    UIImage *image = [themeManager getThemeImage:_imageName];
    UIImage *highlightImage = [themeManager getThemeImage:_highlightImageName];

    [self setImage:image forState:UIControlStateNormal];
    [self setImage:highlightImage forState:UIControlStateHighlighted];
    
    UIImage *backImage = [themeManager getThemeImage:_backgroundImageName];
    backImage = [backImage stretchableImageWithLeftCapWidth:3 topCapHeight:3];
    UIImage *backHighlightImage = [themeManager getThemeImage:_backgroundHighlightImageName];
    backHighlightImage = [backHighlightImage stretchableImageWithLeftCapWidth:3 topCapHeight:3];
    
    [self setBackgroundImage:backImage forState:UIControlStateNormal];
    [self setBackgroundImage:backHighlightImage forState:UIControlStateHighlighted];
}

#pragma mark - setter
- (void)setImageName:(NSString *)imageName {
    if (_imageName != imageName) {
        _imageName = [imageName copy];
    }
    [self loadThemeImage];
}

- (void)setHighlightImageName:(NSString *)highlightImageName {
    if (_highlightImageName != highlightImageName) {
        _highlightImageName = [highlightImageName copy];
    }
    [self loadThemeImage];
}

- (void)setBackgroundImageName:(NSString *)backgroundImageName {
    if (_backgroundImageName != backgroundImageName) {
        _backgroundImageName = [backgroundImageName copy];
    }
    [self loadThemeImage];
}

- (void)setBackgroundHighlightImageName:(NSString *)backgroundHighlightImageName {
    if (_backgroundHighlightImageName != backgroundHighlightImageName) {
        _backgroundHighlightImageName = [backgroundHighlightImageName copy];
    }
    [self loadThemeImage];
}

#pragma mark - Memery Manager
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeDidChangeNotification object:nil];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
