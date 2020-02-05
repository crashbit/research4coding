//
//  Shape.swift
//  Shapes2D
//
//  Created by Germán Santos Jaimes on 30/12/19.
//  Copyright © 2019 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class Shape: UIView{
    let BoxSize: CGFloat = 32.0
    var chunks: [Chunk] = []
    
    override func draw(_ rect: CGRect) {
        
        setData()
        initGestureRecognizers()
        currentContext.protectGState {
            drawControls()
        }
    }
    
    func drawControls(){
        currentContext.protectGState {
            drawControlPoints()
        }
    }
    
    func drawControlPoints(){
        for chunk in chunks{
            for controlPoint in chunk.controlPoints(){
                drawBoxAt(controlPoint, color: .red)
            }
        }
    }
    
    func boxForPoint(_ point: CGPoint) -> CGRect {
        let boxxy = CGRect(x: point.x - BoxSize / 2.0,
                           y: point.y - BoxSize / 2.0,
                           width: BoxSize, height: BoxSize)
        return boxxy
    }
    
    func drawBoxAt(_ point: CGPoint, color: UIColor) {
        let rect = boxForPoint(point);

        currentContext.protectGState {
            currentContext.addRect(rect)
            color.set()
            currentContext.fillPath()
        }
    }
    
    func addChunk(_ chunk: Chunk){
        chunks.append(chunk)
    }
    
    
    func setData(){
        addChunk(.moveTo(point: CGPoint(x: 100, y: 100)))
        addChunk(.moveTo(point: CGPoint(x: 200, y: 200)))
        addChunk(.moveTo(point: CGPoint(x: 300, y: 300)))
        addChunk(.moveTo(point: CGPoint(x: 400, y: 400)))
        addChunk(.moveTo(point: CGPoint(x: 300, y: 500)))
        addChunk(.moveTo(point: CGPoint(x: 300, y: 600)))
        addChunk(.moveTo(point: CGPoint(x: 300, y: 700)))
    }
    
    
    func initGestureRecognizers(){
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tapOnMe))
        addGestureRecognizer(tapGR)
    }
    
    
    @objc func tapOnMe(tapGR: UITapGestureRecognizer){
        let localPoint = tapGR.location(in: self)
        
        for(chunkIndex, chunk) in chunks.enumerated(){
            var caja = boxForPoint( chunk.controlPoints().first!)
            if caja.contains(localPoint){
                drawBoxAt(CGPoint(x: 10,y: 10), color: .blue)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
