//
//  UIView+CornerShadow.m
//  GradientButton
//
//  Created by Biggerlens on 2021/8/13.
//  Copyright © 2021 com.tb. All rights reserved.
//

#import "UIView+CornerShadow.h"
static CGFloat rRadii = 8.0f;//默认圆角大小

@implementation UIView (CornerShadow)

- (void)addCornersAndShadow {
    [self addCorners:UIRectCornerAllCorners rRadii:rRadii shadowLayer:NULL];
}

- (void)addCorners:(UIRectCorner)corners
       shadowLayer:(void (^)(CALayer * shadowLayer))shadowLayer{
    
    [self addCorners:corners rRadii:rRadii shadowLayer:shadowLayer];
}
- (void)addCorners:(UIRectCorner)corners
            rRadii:(CGFloat)rRadii{
    
    [self addCorners:corners rRadii:rRadii shadowLayer:^(CALayer * shadowLayer) {
        shadowLayer.shadowOpacity = 0.25;
        shadowLayer.shadowOffset = CGSizeZero;
        shadowLayer.shadowRadius = 10;
    }];
}

- (void)addCorners:(UIRectCorner)corners
            rRadii:(CGFloat)rRadii
       shadowLayer:(nullable void (^)(CALayer * shadowLayer))shadowLayer{
    
    UIView * aview = self;
    CGSize cornerRadii = CGSizeMake(rRadii, rRadii);
    
    //前面的裁剪
    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.path = [UIBezierPath bezierPathWithRoundedRect:aview.bounds
    byRoundingCorners:corners cornerRadii:cornerRadii].CGPath;
    aview.layer.mask = mask;
   
    //后面的那个
    if(!aview.superview) return;
    UIView * draftView = [[UIView alloc] initWithFrame:aview.frame];
    draftView.backgroundColor = aview.backgroundColor;
    [aview.superview insertSubview:draftView belowSubview:aview];
    
    if(shadowLayer){
        shadowLayer(draftView.layer);
    }else{
        draftView.layer.shadowOpacity = 0.25;
        draftView.layer.shadowOffset = CGSizeZero;
        draftView.layer.shadowRadius = 10;
    }
    
    draftView.backgroundColor = nil;
    draftView.layer.masksToBounds = NO;
    
    CALayer *cornerLayer = [CALayer layer];
    cornerLayer.frame = draftView.bounds;
    cornerLayer.backgroundColor = aview.backgroundColor.CGColor;

    CAShapeLayer *lay = [CAShapeLayer layer];
    lay.path = [UIBezierPath bezierPathWithRoundedRect:aview.bounds
    byRoundingCorners:corners cornerRadii:cornerRadii].CGPath;
    cornerLayer.mask = lay;
    [draftView.layer addSublayer:cornerLayer];
}
@end
