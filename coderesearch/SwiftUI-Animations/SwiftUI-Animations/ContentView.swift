//
//  ContentView.swift
//  SwiftUI-Animations
//
//  Created by Germán Santos Jaimes on 16/01/20.
//  Copyright © 2020 Germán Santos Jaimes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Ejemplo de animación")
            SubtitleText("Partes de una animación")
            BannerText("El boton cambia el valor de una variable")
            
            Circle()
                .foregroundColor(.orange)
                .frame(width: 100, height: 100)
                .offset(x: 0, y: change ? 300 : 0)
                .animation(.easeInOut)
            
            Spacer()
            
            Button("Cambiar"){
                self.change.toggle()
            }.padding(.bottom)
        }.font(.title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
