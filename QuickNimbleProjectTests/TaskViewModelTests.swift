//
//  TaskViewModelTests.swift
//  QuickNimbleProjectTests
//
//  Created by Alex Hernández on 13/3/25.
//

import Quick
import Nimble
@testable import QuickNimbleProject

class TaskViewModelTests: QuickSpec {
    override func spec() {
        describe("TaskViewModel") {
            var viewModel: TaskViewModel!
            
            beforeEach {
                viewModel = TaskViewModel()
            }
            
            context("when adding tasks") {
                it("should increase the task count") {
                    viewModel.addTask(title: "Test Task")
                    expect(viewModel.numberOfTasks).to(equal(1))
                }
                
                it("should not add empty tasks") {
                    viewModel.addTask(title: "   ")
                    expect(viewModel.numberOfTasks).to(equal(0))
                }
            }
            
            context("when toggling task completion") {
                it("should mark a task as completed") {
                    viewModel.addTask(title: "Test Task")
                    viewModel.toggleTaskCompletion(at: 0)
                    expect(viewModel.task(at: 0)?.isCompleted).to(beTrue())
                }
                
                it("should unmark a completed task") {
                    viewModel.addTask(title: "Test Task")
                    viewModel.toggleTaskCompletion(at: 0)
                    viewModel.toggleTaskCompletion(at: 0)
                    expect(viewModel.task(at: 0)?.isCompleted).to(beFalse())
                }
            }
            
            context("when removing tasks") {
                it("should decrease the task count") {
                    viewModel.addTask(title: "Task 1")
                    viewModel.addTask(title: "Task 2")
                    viewModel.removeTask(at: 0)
                    expect(viewModel.numberOfTasks).to(equal(1))
                }
                
                it("should do nothing if the index is out of bounds") {
                    viewModel.removeTask(at: 5)
                    expect(viewModel.numberOfTasks).to(equal(0))
                }
            }
        }
    }
}
