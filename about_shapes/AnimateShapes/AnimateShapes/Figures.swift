//
//  Figures.swift
//  AnimateShapes
//
//  Created by Germán Santos Jaimes on 31/12/19.
//  Copyright © 2019 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class Figures: UIView {
    var starPath: UIBezierPath!
    var rectanglePath: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        drawStar()
        createCircle()
        createCircle2()
        createCircle3()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//        print("método draw")
//    }
    
    func drawStar(){
        starPath = UIBezierPath()
        starPath.move(to: CGPoint(x: 81.5, y: 7.0))
        starPath.addLine(to: CGPoint(x: 101.07, y: 63.86))
        starPath.addLine(to: CGPoint(x: 163.0, y: 64.29))
        starPath.addLine(to: CGPoint(x: 113.16, y: 99.87))
        starPath.addLine(to: CGPoint(x: 131.87, y: 157.0))
        starPath.addLine(to: CGPoint(x: 81.5, y: 122.13))
        starPath.addLine(to: CGPoint(x: 31.13, y: 157.0))
        starPath.addLine(to: CGPoint(x: 49.84, y: 99.87))
        starPath.addLine(to: CGPoint(x: 0.0, y: 64.29))
        starPath.addLine(to: CGPoint(x: 61.93, y: 63.86))
        starPath.addLine(to: CGPoint(x: 81.5, y: 7.0))
        
        rectanglePath = UIBezierPath()
        rectanglePath.move(to: CGPoint(x: 81.5, y: 7.0))
        rectanglePath.addLine(to: CGPoint(x: 163.0, y: 7.0))
        rectanglePath.addLine(to: CGPoint(x: 163.0, y: 82.0))
        rectanglePath.addLine(to: CGPoint(x: 163.0, y: 157.0))
        rectanglePath.addLine(to: CGPoint(x: 163.0, y: 157.0))
        rectanglePath.addLine(to: CGPoint(x: 82.0, y: 157.0))
        rectanglePath.addLine(to: CGPoint(x: 0.0, y: 157.0))
        rectanglePath.addLine(to: CGPoint(x: 0.0, y: 157.0))
        rectanglePath.addLine(to: CGPoint(x: 0.0, y: 82.0))
        rectanglePath.addLine(to: CGPoint(x: 0.0, y: 7.0))
        rectanglePath.addLine(to: CGPoint(x: 81.5, y: 7.0))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = starPath.cgPath
        
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.toValue = rectanglePath.cgPath
        pathAnimation.duration = 0.75
        pathAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pathAnimation.autoreverses = true
        pathAnimation.repeatCount = .greatestFiniteMagnitude

        shapeLayer.add(pathAnimation, forKey: "pathAnimation")
        
        layer.addSublayer(shapeLayer)
    }
    
    func createCircle(){
        let path = UIBezierPath(ovalIn: CGRect(x: 0.0,
        y: 200.0,
        width: self.frame.size.height/2,
        height: self.frame.size.height/2))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.brown.cgColor
        shapeLayer.lineWidth = 3.0
        
        shapeLayer.lineDashPattern = [5]

        let lineDashPhaseAnimation = CABasicAnimation(keyPath: "lineDashPhase")
        lineDashPhaseAnimation.byValue = 10.0
        lineDashPhaseAnimation.duration = 0.75
        lineDashPhaseAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        lineDashPhaseAnimation.repeatCount = .greatestFiniteMagnitude

        shapeLayer.add(lineDashPhaseAnimation, forKey: "lineDashPhaseAnimation")
        
        layer.addSublayer(shapeLayer)
    }
    
    func createCircle2(){
        let path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width - self.frame.size.height,
        y: 200.0,
        width: self.frame.size.height/2,
        height: self.frame.size.height/2))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.brown.cgColor
        shapeLayer.lineWidth = 3.0
        
        shapeLayer.strokeStart = 0.0
        shapeLayer.strokeEnd = 0.0

        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.toValue = 1.0
        strokeEndAnimation.duration = 0.75
        strokeEndAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        strokeEndAnimation.repeatCount = .greatestFiniteMagnitude

        shapeLayer.add(strokeEndAnimation, forKey: "strokeEndAnimation")
        
        
        layer.addSublayer(shapeLayer)
    }
    
    func createCircle3(){
        print(self.frame.size.width)
        let path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width-80,
        y: 200.0,
        width: self.frame.size.height/2,
        height: self.frame.size.height/2))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.brown.cgColor
        shapeLayer.lineWidth = 3.0
        shapeLayer.lineDashPattern = [5]
        
        shapeLayer.strokeStart = 0.0
        shapeLayer.strokeEnd = 1.0

        let strokeStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        strokeStartAnimation.toValue = 1.0
        strokeStartAnimation.duration = 1.25
        strokeStartAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        strokeStartAnimation.repeatCount = .greatestFiniteMagnitude

        shapeLayer.add(strokeStartAnimation, forKey: "strokeStartAnimation")
        layer.addSublayer(shapeLayer)
    }
}
