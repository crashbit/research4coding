//
//  ViewController.swift
//  GradientTest
//
//  Created by Germán Santos Jaimes on 01/01/20.
//  Copyright © 2020 Germán Santos Jaimes. All rights reserved.
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
        gradientLayer.frame = view.bounds
        print("viewDidLoad")
        print(view.bounds)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //gradientLayer.frame = view.bounds
        print("viewDidLayoutSubviews")
        print(view.bounds)
    }


}

