//
//  ThemeUtil.m
//  ThemeChangeOC
//
//  Created by KP_LGX on 16/3/31.
//  Copyright © 2016年 KP_LGX. All rights reserved.
//

#import "ThemeUtil.h"

@implementation ThemeUtil

+ (ThemeButton *)createButton:(NSString *)imageName highlighted:(NSString *)highlightImageName {
    ThemeButton *button = [[ThemeButton alloc] initWithImage:imageName highlighted:highlightImageName];
    return button;
}

+ (ThemeButton *)createButtonWithBackground:(NSString *)backgroundImageName
                      backgroundHighlighted:(NSString *)backgroundHighlightImageName {
    ThemeButton *button = [[ThemeButton alloc] initWithBackground:backgroundImageName highlightedBackground:backgroundHighlightImageName];
    return button;
}

+ (ThemeImageView *)createImageView:(NSString *)imageName {
    ThemeImageView *imageView = [[ThemeImageView alloc] initWithImageName:imageName];
    return imageView;
}

+ (ThemeLabel *)createLabel:(NSString *)colorName {
    ThemeLabel *label = [[ThemeLabel alloc] initWithColorName:colorName];
    return label;
}

@end
