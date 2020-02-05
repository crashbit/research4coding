//
//  TrimOutline.swift
//  SwiftUI-Animations
//
//  Created by Germán Santos Jaimes on 18/01/20.
//  Copyright © 2020 Germán Santos Jaimes. All rights reserved.
//

import SwiftUI

struct TrimOutline: View {
    @State private var circleProgress: CGFloat = 1.0
    
    private var circlePercentage: Int { Int(circleProgress * 100)}
    
    var body: some View {
        VStack(spacing:40){
            Text("Circular shapes").font(.largeTitle)
            Text("Trim function").font(.title).foregroundColor(.gray)
            Text("Trim your shape to only show a percentage of it")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(Color.white)
                .layoutPriority(1)
            
            Circle()
                .trim(from: 0, to: circleProgress)
                .stroke(Color.orange, style: StrokeStyle(lineWidth: 40, lineCap: CGLineCap.round))
                .frame(height:300)
                .rotationEffect(.degrees(-90))
                .overlay(
                    Text("\(circlePercentage)%")
                        .font(.largeTitle)
                        .foregroundColor(.gray))
                .padding(40)
            
            VStack{
                Text("Progress")
                HStack{
                    Text("0%")
                    Slider(value: $circleProgress)
                    Text("100%")
                }
            }.padding()
        }
    }
}

struct TrimOutline_Previews: PreviewProvider {
    static var previews: some View {
        TrimOutline()
    }
}
