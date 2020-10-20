//
//  TaskView.swift
//  SwiftUI101-ToDo-List
//
//  Created by FunnyDev on 20/10/2563 BE.
//

import SwiftUI

struct TaskView: View {
    @ObservedObject var taskViewModel = TaskViewModel()
    @State var showingFormModal = false
    var body: some View {
        NavigationView {
            List {
                ForEach(taskViewModel.tasks) { task in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(task.name)
                                .font(.title2)
                                .bold()
                        }
                        HStack {
                            Text(task.createdDate)
                                .font(.subheadline)
                                .fontWeight(.light)
                        }
                    }
                }
                
            }
            .navigationBarTitle(Text("To-Do List"))
            .navigationBarItems(trailing: Button(action: {
                self.showingFormModal.toggle()
            }){
                Text("Add")
            }.sheet(isPresented: $showingFormModal){
                FormModalView(taskViewModel: taskViewModel)
            })
        }
    }
}

struct FormModalView: View {
    @Environment(\.presentationMode) var presentation
    var taskViewModel: TaskViewModel
    @State private var taskName = ""
    var body: some View {
        Form {
            TextField("task name", text: $taskName)
            Button(action: {
                self.taskViewModel.add(taskViewCell: Task(name: taskName))
                self.presentation.wrappedValue.dismiss()
            }, label: {
                Text("Add")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
