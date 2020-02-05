//
//  TaskListViewModel.swift
//  CB-Tasks
//
//  Created by Germán Santos Jaimes on 03/02/20.
//  Copyright © 2020 Germán Santos Jaimes. All rights reserved.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var taskCellViewModels = [TaskCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        self.taskCellViewModels = testDataTasks.map{ task in
            taskCellViewModels(task: task)
        }
    }
    
    func removeTasks(atOffsets indexSet: IndexSet){
        taskCellViewModels.remove(atOffsets: indexSet)
    }
    
    func addTask(task: Task){
        taskCellViewModels.append(TaskCellViewModel(task: task))
    }
}
