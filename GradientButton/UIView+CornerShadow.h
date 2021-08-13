//
//  UIView+CornerShadow.h
//  GradientButton
//
//  Created by Biggerlens on 2021/8/13.
//  Copyright © 2021 com.tb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (CornerShadow)
- (void)addCornersAndShadow;

- (void)addCorners:(UIRectCorner)corners
       shadowLayer:(void (^)(CALayer * shadowLayer))shadowLayer;

- (void)addCorners:(UIRectCorner)corners
            rRadii:(CGFloat)rRadii;

/*
@param corners 圆角设置
@param rRadii 圆角设置
@return shadowLayer 阴影设置
*/
- (void)addCorners:(UIRectCorner)corners
            rRadii:(CGFloat)rRadii
       shadowLayer:(nullable void (^)(CALayer * shadowLayer))shadowLayer;

@end

NS_ASSUME_NONNULL_END
