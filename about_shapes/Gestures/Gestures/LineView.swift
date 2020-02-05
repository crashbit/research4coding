//
//  LineView.swift
//  Gestures
//
//  Created by Germán Santos Jaimes on 27/12/19.
//  Copyright © 2019 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class LineView: UIView{
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
//         self.path = UIBezierPath(ovalIn: CGRect(x: 0,y: 0,width: 10, height: 10))
//         UIColor.black.setFill()
//         path.fill()
//
//         UIColor.black.setStroke()
//         path.stroke()
        
        print(self.frame)
        let path = UIBezierPath()
        path.move(to: self.frame.origin)
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.stroke()
    }
    
}
