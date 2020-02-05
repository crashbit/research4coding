//
//  ViewController.swift
//  MovingPieces
//
//  Created by Germán Santos Jaimes on 30/12/19.
//  Copyright © 2019 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("empezamos")
        let demoView = DemoView(frame: CGRect(x: 0, y: 0, width: 300, height: 400))
        
        demoView.drawBoxAt(CGPoint(x: 100, y: 100), color: UIColor.red)
    }


}

