//
//  ViewController.m
//  粒子效果OC
//
//  Created by 林洵锋 on 2017/5/21.
//  Copyright © 2017年 LXF. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1 创建粒子发射器
    CAEmitterLayer *emitter = [[CAEmitterLayer alloc] init];
    
    // 2 设置粒子发射器的位置
    emitter.emitterPosition = CGPointMake(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT - 20);
    
    // 3 开启三维效果
    emitter.preservesDepth = YES;
    
    // 4 创建粒子，并设置粒子的相关属性
    // 4.1 创建粒子cell
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    
    // 4.2 设置粒子速度
    cell.velocity = 150;
    cell.velocityRange = 100;
    
    // 4.3 设置粒子的大小
    cell.scale = 0.7;
    cell.scaleRange = 0.3;
    
    // 4.4 设置粒子的方向（弧度）
    cell.emissionLongitude = -M_PI_2;
    cell.emissionRange = M_PI_2 / 6;
    
    // 4.5 设置粒子的存活时间（秒）
    cell.lifetime = 3;
    cell.lifetimeRange = 1.5;
    
    // 4.6 设置粒子旋转（每秒旋转的角度）
    cell.spin = M_PI_2;
    cell.spinRange = M_PI_2 / 2;
    
    // 4.7 设置粒子每秒弹出的个数
    cell.birthRate = 10;
    
    // 4.8 设置粒子展示的图片（传入的值一定是cgImage）
    cell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"good9_30x30"].CGImage);
    
    // 5 将粒子设置到发射器中
    emitter.emitterCells = @[cell];
    
    // 6 将发射器的layer添加到父layer中
    [self.view.layer addSublayer:emitter];
}


@end
