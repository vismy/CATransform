//
//  TransformManager.m
//  ObjectiveTableView
//
//  Created by macPro on 2017/2/21.
//  Copyright © 2017年 macPro. All rights reserved.
//

#import "TransformManager.h"

#define defaultTime 0.1

@implementation TransformManager
+ (void)DefaultRotationView:(UIView *)view angle:(CGFloat)angle x:(CGFloat)x y:(CGFloat)y z:(CGFloat)z andBlock:(block)block{
    [UIView animateWithDuration:defaultTime animations:^{
        view.layer.transform = CATransform3DMakeRotation(angle, x, y, z);
    } completion:^(BOOL finished) {
        block();
    }];
}

+ (void)rotationView:(UIView *)view angle:(CGFloat)angle x:(CGFloat)x y:(CGFloat)y z:(CGFloat)z timeInterval:(CGFloat)timeInterval andBlock:(block)block{
    [UIView animateWithDuration:timeInterval animations:^{
        view.layer.transform = CATransform3DMakeRotation(angle, x, y, z);
    } completion:^(BOOL finished) {
        block();
    }];
}


+ (void)DefaultScaleView:(UIView *)view x:(CGFloat)x y:(CGFloat)y z:(CGFloat)z andBlock:(block)block{
    [UIView animateWithDuration:defaultTime animations:^{
        view.layer.transform = CATransform3DMakeScale(x, y, z);
    } completion:^(BOOL finished) {
        block();
    }];
}

+ (void)scaleView:(UIView *)view x:(CGFloat)x y:(CGFloat)y z:(CGFloat)z timeInterval:(CGFloat)timeInterval andBlock:(block)block{
    [UIView animateKeyframesWithDuration:timeInterval delay:0 options:UIViewKeyframeAnimationOptionCalculationModePaced animations:^{
        view.layer.transform = CATransform3DMakeScale(x, y, z);
    } completion:^(BOOL finished) {
        block();
    }];
    

}

+ (void)DefaultTransitionView:(UIView *)view x:(CGFloat)x y:(CGFloat)y z:(CGFloat)z andBlock:(block)block{
    
    [UIView animateKeyframesWithDuration:defaultTime delay:0 options:UIViewKeyframeAnimationOptionCalculationModePaced animations:^{
        view.layer.transform = CATransform3DMakeTranslation(x, y, z);
    } completion:^(BOOL finished) {
        block();
    }];

}

+ (void)transitionView:(UIView *)view x:(CGFloat)x y:(CGFloat)y z:(CGFloat)z timeInterval:(CGFloat)timeInterval andBlock:(block)block{
    
    [UIView animateKeyframesWithDuration:timeInterval delay:0 options:UIViewKeyframeAnimationOptionCalculationModePaced animations:^{
        view.layer.transform = CATransform3DMakeTranslation(x, y, z);
    } completion:^(BOOL finished) {
        block();
    }];
    

}

+ (void)gradualView:(UIView *)view alpha:(CGFloat)alpha timeInterval:(CGFloat)timeInterval andBlock:(block)block{
    
    [UIView animateKeyframesWithDuration:timeInterval delay:0 options:UIViewKeyframeAnimationOptionCalculationModePaced animations:^{
        view.alpha = alpha;
    } completion:^(BOOL finished) {
        block();
    }];
    
//    [UIView animateWithDuration:timeInterval animations:^{
//        view.alpha = timeInterval;
//    } completion:^(BOOL finished) {
//        block();
//    }];
}


@end
