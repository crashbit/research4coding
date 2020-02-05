//
//  circleView.swift
//  Gestures
//
//  Created by Germán Santos Jaimes on 27/12/19.
//  Copyright © 2019 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class CircleView: UIView{
    var path: UIBezierPath!
    var id: Int!
    var lastLocation = CGPoint(x: 0, y: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
        initGestureRecognizers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        //self.createCuadrado()
        self.path = UIBezierPath(ovalIn: self.bounds)
        UIColor.orange.setFill()
        path.fill()
        
        UIColor.purple.setStroke()
        path.stroke()
    }
    
    func initGestureRecognizers(){
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tapOnMe))
        addGestureRecognizer(tapGR)
        
        let panGR = UIPanGestureRecognizer(target: self, action: #selector(panOnMe))
        addGestureRecognizer(panGR)
    }
    
    @objc func tapOnMe(tapGR: UITapGestureRecognizer){
        print("me toco soy el ", self.id)
        print("Mis coordenadas actuales: ", self.center.x, self.center.y)
    }
    
    @objc func panOnMe(panGR: UIPanGestureRecognizer){
        print("me quieren mover soy el ", self.id)
        let translation = panGR.translation(in: self.superview)
        self.center = CGPoint(x: lastLocation.x + translation.x, y: lastLocation.y + translation.y)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Empezó a tocarme, soy el : ", self.id)
        self.superview?.bringSubviewToFront(self)
        lastLocation = self.center
    }
    
    func createCuadrado(){
        print(self.frame )
        
//        let x = self.frame.origin.x
//        let y = self.frame.origin.y
        // Initialize the path.
       path = UIBezierPath()
    
       // Specify the point that the path should start get drawn.
        path.move(to: CGPoint(x: 0, y: 0))
    
       // Create a line between the starting point and the bottom-left side of the view.
       path.addLine(to: CGPoint(x: 0, y: self.frame.size.height))
    
       // Create the bottom line (bottom-left to bottom-right).
       path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
    
       // Create the vertical line from the bottom-right to the top-right side.
       path.addLine(to: CGPoint(x: self.frame.size.width, y: 0))
    
       // Close the path. This will create the last line automatically.
       path.close()
        print("figura creada")
    }
    
    
}
