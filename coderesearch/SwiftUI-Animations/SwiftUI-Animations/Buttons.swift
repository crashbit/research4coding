//
//  Buttons.swift
//  SwiftUI-Animations
//
//  Created by Germán Santos Jaimes on 18/01/20.
//  Copyright © 2020 Germán Santos Jaimes. All rights reserved.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        
        ZStack {
            VStack(spacing: 40) {
                Text("Button")
                    .font(.largeTitle)
                Text("Floating")
                    .font(.title).foregroundColor(.gray)
                Text("Se pueden crear botones flotantes usando ZStack")
                    .font(.body)
                
                Spacer()
            }
            
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {}){
                        Image(systemName: "plus")
                            .font(.title)
                    }
                .padding(20)
                    .foregroundColor(.white)
                    .background(Color.orange)
                    .cornerRadius(.infinity)
                }
                .padding(.trailing, 30)
            }
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
