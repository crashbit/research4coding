//
//  ShapeView.swift
//  GraphicsProject
//
//  Created by Germán Santos Jaimes on 29/12/19.
//  Copyright © 2019 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class ShapeView: UIView {

    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
        //rectangleShapeLayer()
        //maskVsSublayer()
        //createDottedLine()
        //antsEffect()
        otherAnts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func draw(_ rect: CGRect) {
//        //createLine()
//        //createReactangle()
//        //createTriangle()
//        //createOval()
//        //createCircle()
//        //createRectangleRoundedCorner()
//        //createRectangleRoundedSomeCorner()
//        //createArc()
//
//        UIColor.orange.setFill()
//        path.fill()
//
//        UIColor.purple.setStroke()
//        path.stroke()
//    }
    
    
    //MARK: — Funciones para crear figuras geometricas
    //MARK: — Usando el método draw: rect
    func createLine(){
        path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.lineWidth = 3.0
        
    }
    
    func createReactangle(){
        
        path = UIBezierPath()
        
        // Specify the point that the path should start get drawn.
       path.move(to: CGPoint(x: 0.0, y: 0.0))
    
       // Create a line between the starting point and the bottom-left side of the view.
       path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
    
       // Create the bottom line (bottom-left to bottom-right).
       path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
    
       // Create the vertical line from the bottom-right to the top-right side.
       path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
    
       // Close the path. This will create the last line automatically.
       path.close()
    }
    
    func createTriangle(){
        path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.width/2, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.close()
    }
    
    func createOval(){
        path = UIBezierPath(ovalIn: self.bounds)
    }
    
    func createCircle(){
        path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width/2 - self.frame.size.height/2,
        y: 0.0,
        width: self.frame.size.height,
        height: self.frame.size.height))
    }
    
    func createRectangleRoundedCorner(){
        path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 20.0)
    }
    
    func createRectangleRoundedSomeCorner(){
        path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: CGSize(width: 20.0, height: 0.0))
    }
    
    func createArc(){
        path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2),
        radius: self.frame.size.height/2,
        startAngle: CGFloat(180.0).toRadians(),
        endAngle: CGFloat(0.0).toRadians(),
        clockwise: true)
    }
    
    //MARK: — Usando la clase CAShapeLayer
    
    func rectangleShapeLayer(){
        createReactangle()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.strokeColor = UIColor.brown.cgColor
        shapeLayer.lineWidth = 3.0
        
        layer.addSublayer(shapeLayer)
        
    }
    
    func maskVsSublayer() {
        self.createTriangle()
     
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.yellow.cgColor
     
        //self.layer.addSublayer(shapeLayer)
        self.layer.mask = shapeLayer
    }
    
    func createDottedLine(){
        let caShapeLayer = CAShapeLayer()
        caShapeLayer.strokeColor = UIColor.red.cgColor
        caShapeLayer.lineWidth = 3.0
        caShapeLayer.lineDashPattern = [2,3]
        let cgPath = CGMutablePath()
        let cgPoint = [CGPoint(x: 0, y: 0), CGPoint(x: self.frame.width, y: 0)]
        cgPath.addLines(between: cgPoint)
        caShapeLayer.path = cgPath
        layer.addSublayer(caShapeLayer)
    }
    
    func antsEffect(){
        let caShapeLayer = CAShapeLayer()
        let bounds = CGRect(x: 50, y: 50, width: 250, height: 250)
        caShapeLayer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 20, height: 20)).cgPath
        caShapeLayer.strokeColor = UIColor.black.cgColor
        caShapeLayer.fillColor = nil
        caShapeLayer.lineDashPattern = [8, 6]
        layer.addSublayer(caShapeLayer)
        
        caShapeLayer.lineDashPattern?.reduce(0) { $0 - $1.intValue } ?? 0
        
        let animation = CABasicAnimation(keyPath: "lineDashPhase")
        animation.fromValue = 0
        animation.toValue = caShapeLayer.lineDashPattern?.reduce(0) { $0 - $1.intValue } ?? 0
        animation.duration = 1
        animation.repeatCount = .infinity
        layer.add(animation, forKey: "line")
    }
    
    func otherAnts(){
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.lineDashPattern = [10,5,5,5]
             
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 0, y: 100),
                                CGPoint(x: 200, y: 100)])
        shapeLayer.path = path
             
        let lineDashAnimation = CABasicAnimation(keyPath: "lineDashPhase")
        lineDashAnimation.fromValue = 0
        lineDashAnimation.toValue = shapeLayer.lineDashPattern?.reduce(0) { $0 + $1.intValue }
        lineDashAnimation.duration = 1
        lineDashAnimation.repeatCount = Float.greatestFiniteMagnitude
             
        shapeLayer.add(lineDashAnimation, forKey: nil)
        layer.addSublayer(shapeLayer)
    }
    
    
}

//MARK: - Creamos una extensión para el manejo de radianes
extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat(M_PI) / 180.0
    }
}
