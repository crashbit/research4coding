//
//  ViewController.swift
//  Gestures
//
//  Created by Germán Santos Jaimes on 27/12/19.
//  Copyright © 2019 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var id: Int = 0
    var lastPoint = CGPoint.zero
    var beginLine: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(didTap))
        
        self.view.addGestureRecognizer(tapGR)
        print("listo")
    }

    @objc func didTap(tapGR: UITapGestureRecognizer){
        let coord = tapGR.location(in: self.view)
        
        let newShape = CircleView(frame: CGRect(x: coord.x, y: coord.y, width:100, height: 100))
        id = id + 1
        newShape.id = id
        self.view.addSubview(newShape)
        newShape.layer.backgroundColor = UIColor.gray.cgColor
        
        let nuevaLinea = LineView(frame: CGRect(x: 45, y: 45, width: 200, height: 300))
        
        view.addSubview(nuevaLinea)

        
    }
    
    func drawLineFromPoint(start : CGPoint, toPoint end:CGPoint, ofColor lineColor: UIColor, inView view:UIView) {

        //design the path
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)

        //design path in layer
        var shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 2.0

        view.layer.addSublayer(shapeLayer)
        lastPoint = end
    }

}

