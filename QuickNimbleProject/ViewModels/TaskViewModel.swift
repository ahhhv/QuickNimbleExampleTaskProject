//
//  TaskViewModel.swift
//  QuickNimbleProject
//
//  Created by Alex Hernández on 13/3/25.
//

import Foundation

class TaskViewModel {
    private(set) var tasks: [Task] = []
    
    var numberOfTasks: Int {
        return tasks.count
    }
    
    var hasTasks: Bool {
        return !tasks.isEmpty
    }
    
    func addTask(title: String) {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTitle.isEmpty else { return }
        
        let task = Task(title: trimmedTitle, isCompleted: false)
        tasks.append(task)
    }
    
    func removeTask(at index: Int) {
        guard tasks.indices.contains(index) else { return }
        tasks.remove(at: index)
    }
    
    func toggleTaskCompletion(at index: Int) {
        guard tasks.indices.contains(index) else { return }
        tasks[index].isCompleted.toggle()
    }
    
    func task(at index: Int) -> Task? {
        guard tasks.indices.contains(index) else { return nil }
        return tasks[index]
    }
    
    func loadTasksAsync(completion: @escaping () -> Void) {
        DispatchQueue.global().async {
            sleep(2)
            self.tasks = [
                Task(title: "Tarea 1", isCompleted: false),
                Task(title: "Tarea 2", isCompleted: false)
            ]
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}
