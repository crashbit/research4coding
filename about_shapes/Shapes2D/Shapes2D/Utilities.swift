//
//  Utilities.swift
//  Shapes2D
//
//  Created by Germán Santos Jaimes on 30/12/19.
//  Copyright © 2019 Germán Santos Jaimes. All rights reserved.
//

import UIKit

extension UIView{
    var currentContext: CGContext{
        let context = UIGraphicsGetCurrentContext()
        return context!
    }
}

extension CGContext{
    func protectGState(_ drawStuff: () -> Void) {
        saveGState()
        drawStuff()
        restoreGState()
    }
}
