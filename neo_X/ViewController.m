//
//  ViewController.m
//  neo_X
//
//  Created by Yongjia Liu on 13-7-29.
//  Copyright (c) 2013年 Yongjia Liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(50,150,150, 150)];
    label.text=@" Welcome ! To the crazy ones!";
    label.font=[UIFont fontWithName:@"Avenir Next" size:20];
    label.textColor=[UIColor blackColor];
    label.adjustsFontSizeToFitWidth=YES;
    label.backgroundColor = [UIColor clearColor]; 
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(100,250,150, 150)];
    label2.text=@" You change the world";
    label2.font=[UIFont fontWithName:@"Avenir Next" size:20];
    label2.textColor=[UIColor blackColor];
    label2.adjustsFontSizeToFitWidth=YES;
    label2.backgroundColor = [UIColor clearColor];
    [self BeginAnim:label];
    [self BeginAnim:label2];
    [self.view addSubview:label2];
    [self.view addSubview:label];
    //    animGroup.duration = 1;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)BeginAnim:(UILabel*)label{
    CGPoint fromPoint1 = label.center;
    UIBezierPath *movePath1 = [UIBezierPath bezierPath];
    [movePath1 moveToPoint:fromPoint1];
    CGPoint toPoint1 = CGPointMake(label.frame.origin.x+100, label.frame.origin.y/3);
    [movePath1 addQuadCurveToPoint:toPoint1
                      controlPoint:CGPointMake(100,100)];
    CAKeyframeAnimation *moveAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnim.path = movePath1.CGPath;
    //旋转变化
    CABasicAnimation *scaleAnim1 = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnim1.fillMode=kCAFillModeBackwards;
    scaleAnim1.removedOnCompletion=NO;
    scaleAnim1.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    //x，y轴缩小到0.1,Z 轴不变
    
    scaleAnim1.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1.0)];
    
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations = [NSArray arrayWithObjects:moveAnim, scaleAnim1, nil];
    animGroup.duration=1;
    animGroup.fillMode=kCAFillModeForwards;
    animGroup.removedOnCompletion=NO;
    [label.layer addAnimation:animGroup forKey:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
