//
//  ThemeUtil.h
//  ThemeChangeOC
//  主题UI创建工具类
//  Created by KP_LGX on 16/3/31.
//  Copyright © 2016年 KP_LGX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThemeLabel.h"
#import "ThemeButton.h"
#import "ThemeImageView.h"

@interface ThemeUtil : NSObject

+ (ThemeButton *)createButton:(NSString *)imageName highlighted:(NSString *)highlightImageName;

+ (ThemeButton *)createButtonWithBackground:(NSString *)backgroundImageName
                      backgroundHighlighted:(NSString *)backgroundHighlightImageName;

+ (ThemeImageView *)createImageView:(NSString *)imageName;

+ (ThemeLabel *)createLabel:(NSString *)colorName;

@end
