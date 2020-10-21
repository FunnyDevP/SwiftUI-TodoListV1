//
//  TaskViewModel.swift
//  SwiftUI101-ToDo-List
//
//  Created by FunnyDev on 20/10/2563 BE.
//

import SwiftUI
import Combine

final class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    func add(taskViewCell cell: Task) {
        self.tasks.append(cell)
    }
    
    func update(_ task: Task) {
        if let index = self.tasks.firstIndex(where: { $0.id == task.id }) {
            self.tasks[index] = task
        }
    }
    
}

struct Task: Identifiable {
    var id = UUID()
    var name: String
    var createdDate = Date().description
}


