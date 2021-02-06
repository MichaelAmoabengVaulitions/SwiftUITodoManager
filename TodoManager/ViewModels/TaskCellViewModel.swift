//
//  TaskCellviewModel.swift
//  TodoManager
//
//  Created by Michael Amoabeng on 06.02.21.
//

import Foundation
import Combine

class TaskCellViewModel: ObservableObject, Identifiable {
    @Published var task: Task
    var id: String = ""
    @Published var completionStateIconName = ""
    private var cancellables = Set<AnyCancellable>()
    
    init(task: Task) {
        self.task = task
        $task
            .map {task in
                task.completed ? "checkmark.circle.fill" : "circle"
            }
            .assign(to: \.completionStateIconName, on: self)
            .store(in: &cancellables)
        
        $task
            .compactMap {$0.id}
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    
    }
}
