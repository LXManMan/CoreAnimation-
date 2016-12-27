//
//  ViewController.m
//  CoreAnimation之属性动画
//
//  Created by chuanglong02 on 16/12/27.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "ViewController.h"
#import "BasicAnimationView.h"
#import "KeyFrameAnimationView.h"
static int a = 1;
@interface ViewController ()<CAAnimationDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.icon.hidden = YES;
    BasicAnimationView *animationView =[[BasicAnimationView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    animationView.center  = self.view.center;
    [self.view addSubview:animationView];
    KeyFrameAnimationView *key =[[KeyFrameAnimationView alloc]initWithFrame:CGRectMake(100, 400, 100, 100)];
  
    [self.view addSubview:key];
    
    
    
}
- (IBAction)btnAction:(UIButton *)sender {
    
    // 0、切换图片
    a++;
    if (a> 3) {
        a = 1;
    }
     sender.userInteractionEnabled = NO;
    self.icon.image = [UIImage imageNamed: [NSString stringWithFormat: @"%d.jpg", a]];
    CATransition *animation =[CATransition animation];
    animation.type = @"rippleEffect";
    animation.duration = 2;
    animation.delegate = self;
    animation.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.icon.layer addAnimation:animation forKey:nil];
    sender.userInteractionEnabled = NO;
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.button.userInteractionEnabled = YES;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
