//
//  Utilities+UIView.swift
//  MovingPieces
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
