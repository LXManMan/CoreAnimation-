//
//  BasicAnimationView.m
//  CoreAnimation之属性动画
//
//  Created by chuanglong02 on 16/12/27.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "BasicAnimationView.h"
@interface BasicAnimationView()
@property(nonatomic,strong)CALayer *subLayer;
@end
@implementation BasicAnimationView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
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
        _subLayer.frame = CGRectMake(0, 0, self.bounds.size.width /5, self.bounds.size.height/5);
    }
    return _subLayer;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
        // 创建动画对象
        CABasicAnimation *anim = [CABasicAnimation animation];
    
        anim.keyPath = @"bounds";  // transform.scale 表示长和宽都缩放
        anim.fromValue = [NSValue valueWithCGRect:self.subLayer.bounds];
        anim.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, self.bounds.size.width , self.bounds.size.height )];                  // @0 缩放到最小
    
        anim.duration = 0.5;                // 设置动画执行时间
        anim.repeatCount = MAXFLOAT;        // MAXFLOAT 表示动画执行次数为无限次
    
        anim.autoreverses = YES;            // 控制动画反转 默认情况下动画从尺寸1到0的过程中是有动画的，但是从0到1的过程中是没有动画的，设置autoreverses属性可以让尺寸0到1也是有过程的
    
        [self.subLayer addAnimation: anim forKey: nil];
        // 创建动画对象
//        CABasicAnimation *anim = [CABasicAnimation animation];
//    
//        anim.keyPath = @"transform.scale";  // transform.scale 表示长和宽都缩放
//        anim.toValue = @0;                  // @0 缩放到最小
//    
//        anim.duration = 0.5;                // 设置动画执行时间
//        anim.repeatCount = MAXFLOAT;        // MAXFLOAT 表示动画执行次数为无限次
//    
//        anim.autoreverses = YES;            // 控制动画反转 默认情况下动画从尺寸1到0的过程中是有动画的，但是从0到1的过程中是没有动画的，设置autoreverses属性可以让尺寸0到1也是有过程的
//    
//        [self.icon.layer addAnimation: anim forKey: nil];


}
@end
