//
//  CutOutRectangleDemo.swift
//  SwiftUI-Research-Code
//
//  Created by Germán Santos Jaimes on 26/01/20.
//  Copyright © 2020 Germán Santos Jaimes. All rights reserved.
//

import SwiftUI

struct CutOutRectangleDemo: View {
    @State var cornerRadius: CGFloat = 0.0

    var body: some View {
        CoutOutRectangle(cornerRadius: self.cornerRadius)
            .fill(Color.red)
            .onAppear{
                withAnimation (Animation.easeOut(duration: 0.4).repeatForever(autoreverses: true)){
                    self.cornerRadius = 150.0
                }
            }
    }
}

struct CutOutRectangleDemo_Previews: PreviewProvider {
    static var previews: some View {
        CutOutRectangleDemo()
    }
}
