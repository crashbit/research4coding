//
//  CirclesAnimation.swift
//  SwiftUI-Research-Code
//
//  Created by Germán Santos Jaimes on 27/01/20.
//  Copyright © 2020 Germán Santos Jaimes. All rights reserved.
//

import SwiftUI

struct CirclesAnimation: View {
    @State var trimRing = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.lightGray), style: StrokeStyle(lineWidth: 30))
                .frame(width: 300, height: 300)
            
            Circle()
                .trim(from: 0, to: self.trimRing ? 0.9 : 0)
                .stroke(Color.red, style: StrokeStyle(lineWidth:30, lineCap: .round ))
                .frame(width: 300, height: 300)
                .rotationEffect(.degrees(-90))
                .animation(Animation.linear(duration: 1.0))
                .onAppear{
                    self.trimRing.toggle()
                }
        }
    }
}

struct CirclesAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CirclesAnimation()
    }
}
