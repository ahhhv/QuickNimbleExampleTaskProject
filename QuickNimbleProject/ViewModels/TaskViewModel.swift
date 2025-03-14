class TaskViewModel {
    private(set) var tasks: [Task] = []
    
    func addTask(title: String) {
        let task = Task(title: title, isCompleted: false)
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
}