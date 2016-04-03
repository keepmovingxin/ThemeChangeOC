//
//  ThemeImageView.m
//  ThemeChangeOC
//
//  Created by KP_LGX on 16/3/31.
//  Copyright © 2016年 KP_LGX. All rights reserved.
//

#import "ThemeManager.h"
#import "ThemeImageView.h"

@implementation ThemeImageView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(themeNotification:)
     name:kThemeDidChangeNotification object:nil];
}

- (id)initWithImageName:(NSString *)imageName {
    self = [self init];
    if (self != nil) {
        self.imageName = imageName;
    }
    return self;
}

-(id)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(themeNotification:)
         name:kThemeDidChangeNotification object:nil];
    }
    return self;
}

#pragma mark - setter
- (void)setImageName:(NSString *)imageName {
    if (_imageName != imageName) {
        _imageName = [imageName copy];
    }
    [self loadThemeImage];
}

#pragma mark - NSNotification Actions
- (void)themeNotification:(NSNotification *)notification {
    [self loadThemeImage];
}

- (void)loadThemeImage {
    if (self.imageName == nil) {
        return;
    }
    
    ThemeManager *themeManager = [ThemeManager shareInstance];
    UIImage *image = [themeManager getThemeImage:_imageName];
    image = [image stretchableImageWithLeftCapWidth:self.leftCapWidth topCapHeight:self.topCapHeight];
    self.image = image;
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
