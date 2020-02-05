//
//  CoutOutRectangle.swift
//  SwiftUI-Research-Code
//
//  Created by Germán Santos Jaimes on 26/01/20.
//  Copyright © 2020 Germán Santos Jaimes. All rights reserved.
//

import SwiftUI

struct CoutOutRectangle: Shape {
    var cornerRadius: CGFloat
    
    var animatableData: CGFloat{
        get { cornerRadius }
        set { cornerRadius = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let width = rect.width
            let height = rect.height
            
            path.move(to: CGPoint(x: cornerRadius, y: 0))
            path.addLine(to: CGPoint(x: width-cornerRadius, y: 0))
            
            path.addQuadCurve(to: CGPoint(x: width, y: cornerRadius), control: CGPoint(x: width-cornerRadius, y: cornerRadius))
            //
            path.addLine(to: CGPoint(x: width, y: height-cornerRadius))
            path.addQuadCurve(to: CGPoint(x: width-cornerRadius, y: height), control: CGPoint(x: width-cornerRadius, y: height-cornerRadius))
            //
            path.addLine(to: CGPoint(x: cornerRadius, y: height))
            path.addQuadCurve(to: CGPoint(x: 0, y: height-cornerRadius), control: CGPoint(x: cornerRadius, y: height-cornerRadius))
            //
            path.addLine(to: CGPoint(x: 0, y: cornerRadius))
            path.addQuadCurve(to: CGPoint(x: cornerRadius, y: 0), control: CGPoint(x: cornerRadius, y: cornerRadius))
        }
    }
    
    
}


