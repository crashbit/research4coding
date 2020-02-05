//
//  ViewController.swift
//  AnimateShapes
//
//  Created by Germán Santos Jaimes on 31/12/19.
//  Copyright © 2019 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let width: CGFloat = 240.0
    let height: CGFloat = 160.0

    override func viewDidLoad() {
        super.viewDidLoad()
        let figuras = Figures(frame: CGRect(x: self.view.frame.size.width/2 - width/2, y: self.view.frame.size.height/2 - height/2, width: width, height: height))
        view.addSubview(figuras)
        
    }


}

