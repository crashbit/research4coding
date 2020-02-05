//
//  TinderView.swift
//  SwiftUI-Animations
//
//  Created by Germán Santos Jaimes on 21/01/20.
//  Copyright © 2020 Germán Santos Jaimes. All rights reserved.
//

import SwiftUI

struct User: Hashable, CustomStringConvertible {
    var id: Int
    
    let firstName: String
    let lastName: String
    let age: Int
    let mutualFriends: Int
    let imageName: String
    let occupation: String
    
    var description: String {
        return "\(firstName), id: \(id)"
    }
}

struct TinderView: View {
    @State var users: [User] = [
        User(id: 0, firstName: "Cindy", lastName: "Jones", age: 23, mutualFriends: 4, imageName: "person_1", occupation: "Coach"),
        User(id: 1, firstName: "Mark", lastName: "Bennett", age: 27, mutualFriends: 0, imageName: "person_2", occupation: "Insurance Agent"),
        User(id: 2, firstName: "Clayton", lastName: "Delaney", age: 20, mutualFriends: 1, imageName: "person_3", occupation: "Food Scientist"),
        User(id: 3, firstName: "Brittni", lastName: "Watson", age: 19, mutualFriends: 4, imageName: "person_4", occupation: "Historian"),
        User(id: 4, firstName: "Archie", lastName: "Prater", age: 22, mutualFriends:18, imageName: "person_5", occupation: "Substance Abuse Counselor"),
        User(id: 5, firstName: "James", lastName: "Braun", age: 24, mutualFriends: 3, imageName: "person_6", occupation: "Marketing Manager"),
        User(id: 6, firstName: "Danny", lastName: "Savage", age: 25, mutualFriends: 16, imageName: "person_7", occupation: "Dentist"),
        User(id: 7, firstName: "Chi", lastName: "Pollack", age: 29, mutualFriends: 9, imageName: "person_8", occupation: "Recreational Therapist"),
        User(id: 8, firstName: "Josue", lastName: "Strange", age: 23, mutualFriends: 5, imageName: "person_9", occupation: "HR Specialist"),
        User(id: 9, firstName: "Debra", lastName: "Weber", age: 28, mutualFriends: 13, imageName: "person_10", occupation: "Judge")
    ]
    
    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(users.count - 1 - id) * 20
        return geometry.size.width - offset
    }
    
    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        return  CGFloat(users.count - 1 - id) * 20
    }
    
    // Compute what the max ID in the given users array is.
    private var maxID: Int {
        return self.users.map { $0.id }.max() ?? 0
    }
    
    
    var body: some View {
        VStack {
            // 4
            GeometryReader { geometry in
                // 5
                VStack {
                    DateView()
                    
                     // 6
                    ZStack {
                        
                        // 7
                        ForEach(self.users, id: \.self) { user in
                            CardView()
                                 // 8
                                .frame(width: self.getCardWidth(geometry, id: user.id), height: 400)
                                .offset(x: 0, y: self.getCardOffset(geometry, id: user.id))
                        }
                    }
                    Spacer()
                }
            }
        }.padding()
    }
}

struct TinderView_Previews: PreviewProvider {
    static var previews: some View {
        TinderView()
    }
}

struct DateView: View {
    var body: some View{
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("Martes, 21 de Enero")
                        .font(.title)
                        .bold()
                    Text("Hoy")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }.padding()
        }
        .background(Color.white)
    .cornerRadius(10)
    .shadow(radius: 5)
    }
}
