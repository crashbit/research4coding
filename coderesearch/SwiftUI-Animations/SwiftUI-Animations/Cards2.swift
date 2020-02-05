//
//  Cards2.swift
//  SwiftUI-Animations
//
//  Created by Germán Santos Jaimes on 19/01/20.
//  Copyright © 2020 Germán Santos Jaimes. All rights reserved.
//

import SwiftUI

struct Cards2: View {
    @State var clickPosition = CGPoint(x: 50, y: 50)
    @State var posicion = "0,0"
    @State var grados = 0
    @State var miTupla: (x: CGFloat, y: CGFloat, z: CGFloat) = (x: 1.0,y:0.0, z:0.0)
    
    var body: some View {
        VStack{
            Rectangle()
                .fill(Color.blue)
                .animation(Animation.easeInOut)
                .frame(width: 350, height: 200)
                .cornerRadius(30)
                .padding()
                .rotation3DEffect(Angle(degrees: Double(grados)), axis: miTupla)
                .animation(Animation.easeInOut)
                .gesture(DragGesture()
                    .onChanged({ value in
                        self.posicion = "\(Int(value.location.x)), \(Int(value.location.y))"
                        
                        self.grados = Int(-10.0)
                    })
                )
            
            Text(posicion)
            Image(systemName: "xmark")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct Cards2_Previews: PreviewProvider {
    static var previews: some View {
        Cards2()
    }
}
