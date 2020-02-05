//
//  Cards.swift
//  SwiftUI-Animations
//
//  Created by Germán Santos Jaimes on 18/01/20.
//  Copyright © 2020 Germán Santos Jaimes. All rights reserved.
//

import SwiftUI

struct Cards: View {
    @State var tap = false
    
    var body: some View {
        Rectangle()
            .fill(tap ? Color.orange : Color.blue)
            .animation(Animation.easeInOut)
            .frame(width: 350, height: 200)
            .cornerRadius(30)
            .padding()
            .rotation3DEffect(Angle(degrees: tap ? 360 : 0), axis: (x: 0.0, y: 1.0, z: 0.0))
            .animation(Animation.easeInOut)
            .onTapGesture(count: 1) {
                self.tap.toggle()
            }
    }
}

struct Cards_Previews: PreviewProvider {
    static var previews: some View {
        Cards()
    }
}
