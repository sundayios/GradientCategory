//
//  GradientView.h
//  Eraser
//
//  Created by macbookair on 23/7/2019.
//  Copyright © 2019 Photo Retouch. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GradientView : UIView
@property (nonatomic, strong) NSArray *colorArray;
@property (nonatomic, strong) NSArray *colorLocationArray;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@end

NS_ASSUME_NONNULL_END
