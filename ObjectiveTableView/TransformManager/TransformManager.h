

//
//  TransformManager.h
//  ObjectiveTableView
//
//  Created by macPro on 2017/2/21.
//  Copyright © 2017年 macPro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^block)(void);


@interface TransformManager : NSObject

+ (void)DefaultRotationView:(UIView *)view angle:(CGFloat)angle x:(CGFloat)x y:(CGFloat)y z:(CGFloat)z andBlock:(block)block;

+ (void)rotationView:(UIView *)view angle:(CGFloat)angle x:(CGFloat)x y:(CGFloat)y z:(CGFloat)z timeInterval:(CGFloat)timeInterval andBlock:(block)block;


+ (void)DefaultScaleView:(UIView *)view x:(CGFloat)x y:(CGFloat)y z:(CGFloat)z andBlock:(block)block;

+ (void)scaleView:(UIView *)view x:(CGFloat)x y:(CGFloat)y z:(CGFloat)z timeInterval:(CGFloat)timeInterval andBlock:(block)block;

+ (void)DefaultTransitionView:(UIView *)view x:(CGFloat)x y:(CGFloat)y z:(CGFloat)z andBlock:(block)block;

+ (void)transitionView:(UIView *)view x:(CGFloat)x y:(CGFloat)y z:(CGFloat)z timeInterval:(CGFloat)timeInterval andBlock:(block)block;

+ (void)gradualView:(UIView *)view alpha:(CGFloat)alpha timeInterval:(CGFloat)timeInterval andBlock:(block)block;

@end
