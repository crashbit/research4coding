//
//  Line.swift
//  LinesTest
//
//  Created by Germán Santos Jaimes on 28/12/19.
//  Copyright © 2019 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class Line: UIView{
    var beginPoint: CGPoint!
    var endPoint: CGPoint!
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2.0)
        context?.setStrokeColor(UIColor.red.cgColor)
        context?.move(to: CGPoint(x: self.frame.origin.x, y: self.frame.origin.y))
        context?.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        context?.strokePath()
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tapOnMe))
        addGestureRecognizer(tapGR)
    }
    
    @objc func tapOnMe(tapGR: UITapGestureRecognizer){
        print("me haz tocado señor?")
    }
    
    
    
}
