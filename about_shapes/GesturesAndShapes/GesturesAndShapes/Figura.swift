//
//  Figura.swift
//  GesturesAndShapes
//
//  Created by Germán Santos Jaimes on 31/12/19.
//  Copyright © 2019 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class Figure{
    
    var startCP: CGPoint
    var endCP: CGPoint
    
    
    init(start: CGPoint, end: CGPoint){
        self.startCP = start
        self.endCP = end
    }
    
    func circle() -> CAShapeLayer{
        let path = UIBezierPath(ovalIn: CGRect(x: startCP.x, y: startCP.y,
                                               width: endCP.y,
                                               height: endCP.y))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 5.0

        return shapeLayer
    }
    
    func anima(layer: CAShapeLayer){
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        animation.autoreverses = true
        animation.repeatCount = .infinity
        layer.lineWidth = 10.0
        layer.strokeColor = UIColor.red.cgColor
        layer.add(animation, forKey: "line")
    }
    
    func muevete(nextCP: CGPoint, layer: CAShapeLayer){
        print(layer.frame)
        layer.transform = CATransform3DMakeTranslation(-nextCP.x, nextCP.y, 0)
        print(layer.frame )
    }
    
}
