//
//  TaskListViewController.swift
//  QuickNimbleProject
//
//  Created by Alex Hernández on 13/3/25.
//

import UIKit

class TaskListViewController: UIViewController {
    enum Constants {
        static let topTitle = "Tasks"
        static let title = "New Task"
        static let cancel = "Cancel"
        static let message = "Add a title"
        static let add = "Add"
        static let noTasks = "No tasks available"
    }
    
    private let tableView = UITableView()
    private let emptyView = UILabel()
    private let viewModel = TaskViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.title = Constants.topTitle
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        emptyView.text = Constants.noTasks
        emptyView.textAlignment = .center
        emptyView.textColor = .gray
        emptyView.frame = view.bounds
        view.addSubview(emptyView)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
        updateEmptyView()
    }
    
    private func updateEmptyView() {
        emptyView.isHidden = viewModel.hasTasks
        tableView.isHidden = !viewModel.hasTasks
    }
        
    @objc private func addTask() {
        let alert = UIAlertController(title: Constants.title, message: Constants.message, preferredStyle: .alert)
        alert.addTextField()
        let addAction = UIAlertAction(title: Constants.add, style: .default) { _ in
            if let title = alert.textFields?.first?.text {
                self.viewModel.addTask(title: title)
                self.tableView.reloadData()
                self.updateEmptyView()
            }
        }
        alert.addAction(addAction)
        alert.addAction(UIAlertAction(title: Constants.cancel, style: .cancel))
        present(alert, animated: true)
    }
}

extension TaskListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfTasks
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let task = viewModel.task(at: indexPath.row) {
            cell.textLabel?.text = task.title
            cell.accessoryType = task.isCompleted ? .checkmark : .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.toggleTaskCompletion(at: indexPath.row)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Eliminar") { _, _, completionHandler in
            self.viewModel.removeTask(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.updateEmptyView()
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
