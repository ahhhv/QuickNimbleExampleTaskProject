//
//  TaskViewModelEdgeCasesTests.swift
//  QuickNimbleProject
//
//  Created by Alex Hernández on 13/3/25.
//


import Quick
import Nimble
@testable import QuickNimbleProject

class TaskViewModelEdgeCasesTests: QuickSpec {
    override func spec() {
        describe("TaskViewModel - Edge Cases") {
            var viewModel: TaskViewModel!
            
            beforeEach {
                viewModel = TaskViewModel()
            }
            
            context("when handling extreme cases") {
                it("should not crash with an extremely long task title") {
                    let longTitle = String(repeating: "A", count: 10000)
                    viewModel.addTask(title: longTitle)
                    expect(viewModel.numberOfTasks).to(equal(1))
                }
                
                it("should handle special characters in task title") {
                    let specialTitle = "@#¥€%&*(){}[]!"
                    viewModel.addTask(title: specialTitle)
                    expect(viewModel.numberOfTasks).to(equal(1))
                    expect(viewModel.task(at: 0)?.title).to(equal(specialTitle))
                }
                
                it("should not add duplicate tasks") {
                    viewModel.addTask(title: "Test Task")
                    viewModel.addTask(title: "Test Task")
                    expect(viewModel.numberOfTasks).to(equal(2))
                }
                
                it("should support adding a large number of tasks efficiently") {
                    for i in 0..<1000 {
                        viewModel.addTask(title: "Task \(i)")
                    }
                    expect(viewModel.numberOfTasks).to(equal(1000))
                }
            }
        }
    }
}
