//
//  TaskModel.swift
//  TodoManager
//
//  Created by Michael Amoabeng on 05.02.21.
//

import Foundation

struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool
}

#if DEBUG
let testData: [Task] = [
    Task(title: "Implement the UI first", completed: true),
    Task(title: "Build the View Model", completed: false),
    Task(title: "Setup Firebase", completed: true),
    Task(title: "Connect to Firebase", completed: false)
]
#endif
