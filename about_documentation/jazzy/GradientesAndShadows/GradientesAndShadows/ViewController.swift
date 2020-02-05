//
//  ViewController.swift
//  GradientesAndShadows
//
//  Created by Germán Santos Jaimes on 5/1/19.
//  Copyright © 2019 Germán Santos Jaimes. All rights reserved.
//

import UIKit

/// Este es un proyecto para probar cambios y pruebas de documentación usando **jazzy**

/// This is our initial class, its important to control the first view
class ViewController: UIViewController {
    
    // MARK: Main property
    /// this view will be on the top, its **awesome**
    let topBar: UIView = {
       let v = UIView()
        v.backgroundColor = .blue
        return v
    }()
    
    // MARK: Default View Controller Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(topBar)
    }
    
    // MARK: IBAction Methods
    @IBAction func testing(){
        
    }


}

