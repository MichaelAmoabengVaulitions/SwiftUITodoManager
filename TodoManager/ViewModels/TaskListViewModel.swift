//
//  TaskListViewModel.swift
//  TodoManager
//
//  Created by Michael Amoabeng on 06.02.21.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var taskCellViewModels =  [TaskCellViewModel]()
    private var cancellables  = Set<AnyCancellable>()
    
    init() {
        self.taskCellViewModels = testData.map { task in
            TaskCellViewModel(task: task)
            
        }
    }
    
    func addTask(task: Task) {
        let taskVM = TaskCellViewModel(task: task)
        self.taskCellViewModels.append(taskVM)
    }
}
