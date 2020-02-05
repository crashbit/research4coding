//
//  CGContext+Protection.swift
//  MovingPieces
//
//  Created by Germán Santos Jaimes on 30/12/19.
//  Copyright © 2019 Germán Santos Jaimes. All rights reserved.
//

import CoreGraphics

extension CGContext{
    
    func protectGState(_ drawStuff: () -> Void) {
        saveGState()
        drawStuff()
        restoreGState()
    }
}
