//
//  ViewController.swift
//  GesturesAndShapes
//
//  Created by Germán Santos Jaimes on 31/12/19.
//  Copyright © 2019 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var figurita: Figure!
    var circle: CAShapeLayer!


    override func viewDidLoad() {
        super.viewDidLoad()
        figurita = Figure(start: CGPoint(x: 0,y: 0), end: CGPoint(x: 80,y: 80))
        
        circle = figurita.circle()
        
        view.layer.addSublayer(circle)
        
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tapOnMe))
        view.addGestureRecognizer(tapGR)
        
        let panGR = UIPanGestureRecognizer(target: self, action: #selector(panOnMe))
        view.addGestureRecognizer(panGR)
        
    }
    
    @objc func tapOnMe(tapGR: UITapGestureRecognizer){
        print("click, click")
        print(tapGR.location(in: view))
        print(circle.path?.boundingBox.origin )
        circle.position = CGPoint(x: 100, y: 0)
        print(circle.position)
    }
    
    @objc func panOnMe(panGR: UIPanGestureRecognizer){
        print("move it")
        let translation = panGR.translation(in: view)
        figurita.muevete(nextCP: translation, layer: circle)
    }


}

