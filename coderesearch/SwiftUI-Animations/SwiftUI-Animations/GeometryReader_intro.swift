//
//  GeometryReader_intro.swift
//  SwiftUI-Animations
//
//  Created by Germán Santos Jaimes on 18/01/20.
//  Copyright © 2020 Germán Santos Jaimes. All rights reserved.
//

import SwiftUI

struct GeometryReader_intro: View {
    var body: some View {
        VStack(spacing: 20){
            Text("GeometryReader")
                .font(.largeTitle)
            
            Text("Introduction")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("GeometryReader is a container view that pushes out to fill up all available space. You use it to help with positioning items within it")
                .font(.title)
            .padding()
            .layoutPriority(1)
            
            GeometryReader { geometry in
                Text("Upper left")
                    .font(.title)
                    .position(x:geometry.size.width/5,
                              y:geometry.size.height/10)
                
                Text("Lower Right")
                    .font(.title)
                    .position(x: geometry.size.width - 90,
                              y: geometry.size.height - 40)
                
            }
            .foregroundColor(.white)
            .background(Color.pink)
            
            GeometryReader { geometry in
                VStack(spacing: 10.0){
                    Text("Width: \(geometry.size.width)")
                    Text("Height: \(geometry.size.height)")
                }
                .foregroundColor(.white)
            }
            .background(Color.red)
        .padding(30)
        }
        .font(.title)
    }
}

struct GeometryReader_intro_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader_intro()
    }
}
