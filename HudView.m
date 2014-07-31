//
//  HudView.m
//  JWHudView
//
//  Created by Josh Woods on 7/30/14.
//  Copyright (c) 2014 joshwoods. All rights reserved.
//

#import "HudView.h"

@implementation HudView

+ (instancetype)hudInView:(UIView *)view animated:(BOOL)animated
{
    HudView *hudView = [[HudView alloc] initWithFrame:view.bounds];
    hudView.opaque = NO;
    
    [view addSubview:hudView];
    //    view.userInteractionEnabled = NO;
    
    [hudView showAnimated:animated];
    return hudView;
}

- (void)showAnimated:(BOOL)animated
{
    if (animated) {
        //customize how long the animation takes here
        [UIView animateWithDuration:0.5 animations:^{
            CAKeyframeAnimation *bounceInAnimation = [CAKeyframeAnimation
                                                    animationWithKeyPath:@"transform.scale"];
            bounceInAnimation.delegate = self;
            //values for the bouncing effect here, over time, divided into 1/4ths
            bounceInAnimation.values = @[ @0.7, @1.2, @0.9, @1.0 ];
            bounceInAnimation.keyTimes = @[ @0.0, @0.334, @0.666, @1.0 ];
            bounceInAnimation.timingFunctions = @[
                                                [CAMediaTimingFunction
                                                 functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                                [CAMediaTimingFunction
                                                 functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                                [CAMediaTimingFunction
                                                 functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
            [self.layer addAnimation:bounceInAnimation
                              forKey:@"bounceInAnimation"];
        } completion:^(BOOL finished){
            [self performSelector:@selector(closeScreen) withObject:nil afterDelay:0.6];
        }];
    }
}

- (void)closeScreen{
    //customize how long the animation takes here
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rect = self.layer.bounds;
        rect.origin.y += rect.size.height;
        self.frame = rect;
    } completion:^(BOOL finished){
        [self removeFromSuperview];
    }];
}

- (void)drawRect:(CGRect)rect
{
    const CGFloat boxWidth = 120.0f;
    const CGFloat boxHeight = 120.0f;
    
    CGRect boxRect = CGRectMake(
                                roundf(self.bounds.size.width - boxWidth) / 2.0f,
                                roundf(self.bounds.size.height - boxHeight) / 2.0f,
                                boxWidth,
                                boxHeight);
    
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:boxRect cornerRadius:10.0f];
    [[UIColor colorWithRed:200/255.0f green:125/255.0f blue:100.0/255.0f alpha:0.9f] setFill];
    [roundedRect fill];
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName : [UIFont systemFontOfSize:16.0f],
                                 NSForegroundColorAttributeName : [UIColor whiteColor]
                                 };
    
    CGSize textSize = [self.hudText sizeWithAttributes:attributes];
    
    CGPoint textPoint = CGPointMake(
                                    self.center.x - roundf(textSize.width / 2.0f),
                                    self.center.y - roundf(textSize.height / 2.0f) + boxHeight / 4.0f);
    
    [self.hudText drawAtPoint:textPoint withAttributes:attributes];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (void)dealloc
{
    NSLog(@"Dealloc %@", self);
}

@end
