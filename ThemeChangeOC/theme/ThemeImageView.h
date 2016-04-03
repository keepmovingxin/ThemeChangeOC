//
//  ThemeImageView.h
//  ThemeChangeOC
//
//  Created by KP_LGX on 16/3/31.
//  Copyright © 2016年 KP_LGX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeImageView : UIImageView

@property (nonatomic,copy) NSString *imageName;

@property (nonatomic,assign) int leftCapWidth;
@property (nonatomic,assign) int topCapHeight;

- (id)initWithImageName:(NSString *)imageName;

@end
