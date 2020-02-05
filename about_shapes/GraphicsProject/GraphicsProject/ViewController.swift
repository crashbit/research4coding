//
//  ViewController.swift
//  GraphicsProject
//
//  Created by Germán Santos Jaimes on 29/12/19.
//  Copyright © 2019 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("viewDidAppear")
        
        let width: CGFloat = 240.0
        let height: CGFloat = 160.0
        
        let shapeView = ShapeView(frame: CGRect(x: self.view.frame.size.width/2 - width/2, y: self.view.frame.size.height/2 - height/2, width: width, height: height))
        
        self.view.addSubview(shapeView)
    }


}

