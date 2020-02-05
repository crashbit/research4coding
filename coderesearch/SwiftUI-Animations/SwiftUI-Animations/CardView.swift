//
//  CardView.swift
//  SwiftUI-Animations
//
//  Created by Germán Santos Jaimes on 22/01/20.
//  Copyright © 2020 Germán Santos Jaimes. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @State private var translation: CGSize = .zero
    
    var body: some View {
        GeometryReader { geometry in
                        
            VStack(alignment: .leading) {
                Image("person_1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                    .clipped()
                
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Alina Sanchez, 22")
                            .font(.title)
                            .bold()
                        Text("Quinto semestre")
                            .font(.subheadline)
                            .bold()
                        Text("30 compas")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    Image(systemName: "info.circle")
                        .foregroundColor(.gray)
                }.padding(.horizontal)
            }
            .padding(.bottom)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .offset(x: self.translation.width, y: 0)
            .animation(.interactiveSpring())
            .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .center)
            .gesture(
                DragGesture()
                    .onChanged{ value in
                        self.translation = value.translation
                    }
                    .onEnded{ value in
                        self.translation = .zero
                    }
            )
        }
    }
}

// 4
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView().frame(height: 400).padding()
    }
}
