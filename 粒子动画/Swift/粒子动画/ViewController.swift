//
//  ViewController.swift
//  粒子动画
//
//  Created by 林洵锋 on 2017/5/20.
//  Copyright © 2017年 LXF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 1.创建发射器
        let emitter = CAEmitterLayer()
        
        // 2.设置发射器的位置
        emitter.emitterPosition = CGPoint(x: view.bounds.width * 0.5, y: view.bounds.height - 20)
        
        // 3.开启三维效果
        emitter.preservesDepth = true
        
        // 4.创建粒子，并且设置粒子的相关属性
        // 4.1 创建粒子的cell
        let cell = CAEmitterCell()
        
        // 4.2 设置粒子速度
        cell.velocity = 150
        cell.velocityRange = 100 // 50 ~ 250
        
        // 4.3 设置粒子的大小
        cell.scale = 0.7
        cell.scaleRange = 0.3 // 0.4 ~ 1.0
        
        // 4.4 设置粒子方向（弧度）
        // cell.emissionLatitude = // 纬度（水平）
        cell.emissionLongitude = CGFloat(-Double.pi / 2) // 经度（垂直）
        cell.emissionRange = CGFloat(Double.pi / 2 / 6)
        
        // 4.5 设置粒子的存活时间(秒)
        cell.lifetime = 3
        cell.lifetimeRange = 1.5 // 1.5 ~ 4.5
        
        // 4.6 设置粒子旋转（每秒旋转的角度）
        cell.spin = CGFloat(Double.pi / 2)
        cell.spinRange = CGFloat(Double.pi / 2 / 2)
        
        // 4.7 设置粒子每秒弹出的个数
        cell.birthRate = 10
        
        // 4.8 设置粒子展示的图片（传入的值一定是cgImage）
        cell.contents = UIImage(named: "good9_30x30")?.cgImage
        
        // 5.将粒子设置到发射器中
        emitter.emitterCells = [cell]
        
        // 6.将发射器的layer添加到父layer中
        view.layer.addSublayer(emitter)
        
    }
}

