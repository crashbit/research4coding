//
//  ViewController.swift
//  ReDrawRectangle
//
//  Created by Germán Santos Jaimes on 28/12/19.
//  Copyright © 2019 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let overlay = UIView()
    var lastPoint = CGPoint(x: 0, y: 0)
    var endPoint = CGPoint()
    var startPoint = CGPoint()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        overlay.layer.borderColor = UIColor.red.cgColor
        overlay.backgroundColor = UIColor.clear.withAlphaComponent(0.5)
        overlay.isHidden = true
        self.view.addSubview(overlay)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        //Save original tap Point
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
            startPoint = CGPoint(x: lastPoint.x, y: lastPoint.y)
        }
        
        print("Empezaron los toques")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: self.view)
            reDrawSelectionArea(fromPoint: lastPoint, toPoint: currentPoint)
             print("redibujando el area")
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        overlay.isHidden = true
        overlay.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
         print("se terminaron los toques")
        let lastTouch = touches.first
        print(lastTouch?.location(in: self.view).x )
        endPoint = CGPoint(x: (lastTouch?.location(in: self.view).x)!, y: (lastTouch?.location(in: self.view).y)!)
        drawRectangle(start: startPoint, end: endPoint)
        createCuadrado()
    }

    func reDrawSelectionArea(fromPoint: CGPoint, toPoint: CGPoint) {
        overlay.isHidden = false

            //Calculate rect from the original point and last known point
        let rect = CGRect(x: min(fromPoint.x, toPoint.x),
                          y: min(fromPoint.y, toPoint.y),
                          width: fabs(fromPoint.x - toPoint.x),
                          height: fabs(fromPoint.y - toPoint.y));
        

        overlay.frame = rect
    }
    
    func drawRectangle(start: CGPoint, end: CGPoint){
        print("pum dibujamos el rectangulo")
    }
    
    
    func createCuadrado(){
            
    //        let x = self.frame.origin.x
    //        let y = self.frame.origin.y
            // Initialize the path.
           let path = UIBezierPath()
        
           // Specify the point that the path should start get drawn.
            path.move(to: CGPoint(x: 0, y: 0))
        
           // Create a line between the starting point and the bottom-left side of the view.
        path.addLine(to: CGPoint(x: 0, y: self.view.frame.size.height))
        
           // Create the bottom line (bottom-left to bottom-right).
        path.addLine(to: CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height))
        
           // Create the vertical line from the bottom-right to the top-right side.
        path.addLine(to: CGPoint(x: self.view.frame.size.width/2, y: 0))
        
           // Close the path. This will create the last line automatically.
           path.close()
        
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        self.view.layer.addSublayer(shapeLayer)
        
            print("figura creada")
        }
    
    
}

