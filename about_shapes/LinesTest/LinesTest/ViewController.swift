//
//  ViewController.swift
//  LinesTest
//
//  Created by Germán Santos Jaimes on 28/12/19.
//  Copyright © 2019 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let shapeLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        let line = Line(frame: CGRect(x: 10, y: 10, width: 200, height: 200))
        self.view.addSubview(line)
        
        drawLineFromPoint(start: CGPoint(x: 300, y: 0), toPoint: CGPoint(x: 300, y: 500), ofColor: UIColor.black, inView: self.view)
        
        //drawLineFromPoint(start: CGPoint(x: 100, y: 10), toPoint: CGPoint(x: 300, y: 200), ofColor: UIColor.black, inView: self.view)
        
        print(view.layer.sublayers)
        
//        let tapGR = UITapGestureRecognizer(target: self, action: #selector(didTap))
//
//        self.view.addGestureRecognizer(tapGR)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    @objc func didTap(tapGR: UITapGestureRecognizer){
        print("tocando")
    }
    
    func drawLineFromPoint(start : CGPoint, toPoint end:CGPoint, ofColor lineColor: UIColor, inView view:UIView) {

        //design the path
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)

        //design path in layer
        
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 2.0
        view.layer.borderColor = UIColor.blue.cgColor
        view.layer.borderWidth = 20

        view.layer.addSublayer(shapeLayer)
    }


}

