//
//  HudView.h
//  JWHudView
//
//  Created by Josh Woods on 7/30/14.
//  Copyright (c) 2014 joshwoods. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HudView : UIView

+ (instancetype)hudInView:(UIView *)view animated:(BOOL)animated;

@property (nonatomic, strong) NSString *hudText;

@end
