//
//  AnimationViewController.swift
//  LoadResouse
//
//  Created by zhugy on 2017/3/23.
//  Copyright © 2017年 Zhugy. All rights reserved.
//

import UIKit
import Cartography

class AnimationViewController: UIViewController {
    
    let layer: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.red.cgColor
        layer.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        layer.masksToBounds = true
        layer.cornerRadius = 20
        return layer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.layer.addSublayer(layer)
        baseAnimation()
    }
    
    func setUpUI() {
        
    }
    
    
    func baseAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = NSNumber.init(floatLiteral: 1)
        animation.toValue = NSNumber.init(value: 1.5)
        animation.autoreverses = true
        animation.isRemovedOnCompletion = false
        animation.repeatCount = MAXFLOAT
        animation.fillMode = kCAFillModeForwards
        animation.duration = 0.8
        
        layer.add(animation, forKey: "scaleAnimation")
    }
    
    func keyFrame() {
        let key = CAKeyframeAnimation(keyPath: "position")
        key.values = []
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
