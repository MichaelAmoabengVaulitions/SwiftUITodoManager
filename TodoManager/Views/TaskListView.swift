//
//  ContentView.swift
//  TodoManager
//
//  Created by Michael Amoabeng on 05.02.21.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskListVM =  TaskListViewModel()
    @State var presentAddNewItem:Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                List {
                    ForEach(taskListVM.taskCellViewModels) { taskCellVM in
                        TaskCell(taskCellVM: taskCellVM)
                    }
                    if presentAddNewItem {
                        TaskCell(taskCellVM: TaskCellViewModel(task: Task(title: "", completed: false))) { task in
                            self.taskListVM.addTask(task: task)
                            self.presentAddNewItem.toggle()
                        }
                    }
                }.listStyle(InsetListStyle())
                
                Button(action: {self.presentAddNewItem.toggle()}) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .accentColor(.white)
                        
                        Text("Add New task")
                            .foregroundColor(.white)
                    }
                    
                }
                .frame(width:250, height: 30)
                .padding()
                .background(Color(.systemBlue))
                .cornerRadius(20)
                
            } 
            .navigationBarTitle("Tasks")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}

struct TaskCell: View {
    @ObservedObject var taskCellVM: TaskCellViewModel
    var onCommit: (Task) -> (Void) =  { _ in }
    
    var body: some View {
        HStack {
            Image(systemName: taskCellVM.task.completed ?  "checkmark.circle.fill":"circle")
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    self.taskCellVM.task.completed.toggle()
                }
            TextField("Enter the task title", text: $taskCellVM.task.title, onCommit: {
                self.onCommit(self.taskCellVM.task)
            })
                .padding()
        }
    }
}
