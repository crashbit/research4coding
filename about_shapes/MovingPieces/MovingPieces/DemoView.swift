//
//  DemoView.swift
//  MovingPieces
//
//  Created by Germán Santos Jaimes on 30/12/19.
//  Copyright © 2019 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class DemoView: UIView{
    var chunks: [Chunk] = []
    let BoxSize: CGFloat = 16.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        samplePath()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        print("usando el draw")
    }
    
    func boxForPoint(_ point: CGPoint) -> CGRect{
        let boxxy = CGRect(
            x: point.x - BoxSize / 2,
            y: point.y - BoxSize / 2,
            width: BoxSize,
            height: BoxSize)
        return boxxy
    }
    
    func drawBoxAt(_ point: CGPoint, color: UIColor){
        let rect = boxForPoint(point)
        
        currentContext.protectGState {
            currentContext.addRect(rect)
            color.set()
            currentContext.fillPath()
        }
    }
    
    
    
    func addChunk(_ chunk: Chunk){
        chunks.append(chunk)
        print(chunks)
    }
    
    func samplePath(){
        addChunk(.moveTo(point: CGPoint(x: 184, y: 363)))
        addChunk(.lineTo(point: CGPoint(x: 175, y: 400)))
    }
}
