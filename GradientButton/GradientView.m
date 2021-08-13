//
//  GradientView.m
//  Eraser
//
//  Created by macbookair on 23/7/2019.
//  Copyright © 2019 Photo Retouch. All rights reserved.
//

#import "GradientView.h"
#import "UIColor+Extensions.h"
@implementation GradientView
-(id)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self loadGradientLayers];
    }
    return self;
}
-(void)loadGradientLayers{
    self.colorArray = @[(id)[[UIColor colorWithHex:0xFF6347] CGColor],
                        (id)[[UIColor colorWithHex:0xFFEC8B] CGColor],
                        (id)[[UIColor colorWithHex:0x98FB98] CGColor],
                        (id)[[UIColor colorWithHex:0x00B2EE] CGColor],
                        (id)[[UIColor colorWithHex:0x9400D3] CGColor]];
    self.colorLocationArray = @[@0.1, @0.3, @0.5, @0.7, @1.0];
    self.gradientLayer =  [CAGradientLayer layer];
    self.gradientLayer.frame = CGRectMake(2,0,self.frame.size.width-2,self.frame.size.height);
    self.gradientLayer.masksToBounds = YES;
    self.gradientLayer.cornerRadius = self.frame.size.height / 2;
    [self.gradientLayer setLocations:self.colorLocationArray];
    [self.gradientLayer setColors:self.colorArray];
    [self.gradientLayer setStartPoint:CGPointMake(0, 0)];
    [self.gradientLayer setEndPoint:CGPointMake(1.0, 0)];
    [self.layer addSublayer:self.gradientLayer];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
