//
//  ThemeButton.h
//  ThemeChangeOC
//
//  Created by KP_LGX on 16/3/31.
//  Copyright © 2016年 KP_LGX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeButton : UIButton

@property (nonatomic,copy) NSString *imageName;
@property (nonatomic,copy) NSString *highlightImageName;

@property (nonatomic,copy) NSString *backgroundImageName;
@property (nonatomic,copy) NSString *backgroundHighlightImageName;

- (id)initWithImage:(NSString *)imageName highlighted:(NSString *)highlightImageName;

- (id)initWithBackground:(NSString *)backgroundImageName
   highlightedBackground:(NSString *)backgroundHighlightImageName;

@end
