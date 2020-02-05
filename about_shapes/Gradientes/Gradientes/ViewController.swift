//
//  ViewController.swift
//  Gradientes
//
//  Created by Germán Santos Jaimes on 31/12/19.
//  Copyright © 2019 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let gradientLayer: CAGradientLayer = {
           let layer = CAGradientLayer()
           layer.colors = [
               UIColor.red.cgColor,
               UIColor.green.cgColor
           ]
           return layer
       }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.layer.addSublayer(gradientLayer)
        gradientLayer.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        gradientLayer.frame = CGRect(x: 100, y: 100, width: 400, height: 400)
    }
    
    


}

