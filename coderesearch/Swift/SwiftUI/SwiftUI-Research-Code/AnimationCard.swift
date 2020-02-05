//
//  AnimationCard.swift
//  SwiftUI-Research-Code
//
//  Created by Germán Santos Jaimes on 27/01/20.
//  Copyright © 2020 Germán Santos Jaimes. All rights reserved.
//

import SwiftUI

struct AnimationCard: View {
    @State private var change = false
    
    var body: some View {
        GeometryReader { gr in
            VStack(spacing: 20) {
                Text("Esto es una foto")
                    .font(.title)
                    .bold()
                    .animation(.easeOut)
                
                Image("women")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(20)
                    .padding(self.change ? 40 : 0)
                    .frame(width: gr.size.width, height: self.change ? 300 : 600)
                    .animation(.easeOut)
                
                Button(action: {
                    self.change.toggle()
                }, label: {
                    Image(systemName: "chevron.up")
                })
                    .rotationEffect(.degrees(self.change ? 180 : 0))
                    .animation(.easeInOut)
                ScrollView {
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                        .padding(.horizontal)
                        .animation(.easeOut)
                }
            }
        }
        .font(.title)
    }
}

struct AnimationCard_Previews: PreviewProvider {
    static var previews: some View {
        AnimationCard()
    }
}
