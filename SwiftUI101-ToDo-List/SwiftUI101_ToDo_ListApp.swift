//
//  SwiftUI101_ToDo_ListApp.swift
//  SwiftUI101-ToDo-List
//
//  Created by FunnyDev on 20/10/2563 BE.
//

import SwiftUI

@main
struct SwiftUI101_ToDo_ListApp: App {
    var taskViewModel = TaskViewModel()
    var body: some Scene {
        WindowGroup {
            TaskView()
                .environmentObject(taskViewModel)
        }
    }
}
