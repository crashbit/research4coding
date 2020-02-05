//
//  TaskListView.swift
//  CB-Tasks
//
//  Created by Germán Santos Jaimes on 03/02/20.
//  Copyright © 2020 Germán Santos Jaimes. All rights reserved.
//

import SwiftUI

struct TaskListView: View {
    var tasks: [Task] = testDataTasks
    
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading ){
                List{
                    ForEach(self.tasks){ task in
                       TaskCell(task: task)
                    }
                    .onDelete{ indexSet in
                        
                    }
                }
                Button(action: {}){
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("New Task")
                    }
                }
                .padding()
                .accentColor(Color(UIColor.systemRed))
            }
        .navigationBarTitle("Tasks")
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}

struct TaskCell: View {
    var task: Task
    
    var body: some View{
        HStack{
            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
            .resizable()
            .frame(width: 20, height: 20)
            Text(task.title)
        }
    }
}
