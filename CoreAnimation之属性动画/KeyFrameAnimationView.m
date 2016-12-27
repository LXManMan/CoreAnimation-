//
//  KeyFrameAnimationView.m
//  CoreAnimation之属性动画
//
//  Created by chuanglong02 on 16/12/27.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "KeyFrameAnimationView.h"
@interface KeyFrameAnimationView()
@property(nonatomic,strong)CALayer *subLayer;
@end
@implementation KeyFrameAnimationView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self.layer addSublayer:self.subLayer];

        
    }
    return self;
}
-(CALayer *)subLayer
{
    if (!_subLayer) {
        _subLayer =[CALayer layer];
        _subLayer.frame = self.bounds;
        _subLayer.contents = (__bridge id)[UIImage imageNamed:@"heart.jpg"].CGImage;
        _subLayer.frame = self.bounds;
    }
    return _subLayer;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    #define angle2Radio(angle) ((angle) * M_PI / 180.0)
    CAKeyframeAnimation *animation =[CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    animation.values = @[@(angle2Radio(-5)), @(angle2Radio(5)), @(angle2Radio(-5))]; // 把度数转换为弧度  度数/180*M_PI
    animation.repeatCount = HUGE;
    [self.subLayer addAnimation:animation forKey:nil];
    
    

}
@end
