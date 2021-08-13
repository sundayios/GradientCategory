//
//  UIImage+TGradientType.m
//  GradientButton
//
//  Created by Biggerlens on 2021/8/13.
//  Copyright © 2021 com.tb. All rights reserved.
//

#import "UIImage+TGradientType.h"

@implementation UIImage (TGradientType)

+ (UIImage *)gradientColorImageFromColors:(NSArray*)colors gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize {

    NSMutableArray *ar = [NSMutableArray array];

    for(UIColor *c in colors) {

        [ar addObject:(id)c.CGColor];

    }

    UIGraphicsBeginImageContextWithOptions(imgSize, YES, 1);

    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSaveGState(context);

    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);

    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);

    CGPoint start;

    CGPoint end;

    switch (gradientType) {

            case GradientTypeTopToBottom:

            start = CGPointMake(0.0, 0.0);

            end = CGPointMake(0.0, imgSize.height);

            break;

            case GradientTypeLeftToRight:

            start = CGPointMake(0.0, 0.0);

            end = CGPointMake(imgSize.width, 0.0);

            break;

            case GradientTypeUpleftToLowright:

            start = CGPointMake(0.0, 0.0);

            end = CGPointMake(imgSize.width, imgSize.height);

            break;

            case GradientTypeUprightToLowleft:

            start = CGPointMake(imgSize.width, 0.0);

            end = CGPointMake(0.0, imgSize.height);

            break;

            default:

            break;

        }

    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

    CGGradientRelease(gradient);

    CGContextRestoreGState(context);

    CGColorSpaceRelease(colorSpace);

    UIGraphicsEndImageContext();

    return image;

}
@end
