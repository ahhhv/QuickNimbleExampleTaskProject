//
//  TaskViewModelConcurrencyTests.swift
//  QuickNimbleProject
//
//  Created by Alex Hernández on 13/3/25.
//

import Quick
import Nimble
import Foundation
@testable import QuickNimbleProject

class TaskViewModelConcurrencyTests: QuickSpec {
    override func spec() {
        describe("TaskViewModel - Concurrency") {
            var viewModel: TaskViewModel!
            
            beforeEach {
                viewModel = TaskViewModel()
            }
            
            context("when loading tasks asynchronously") {
                it("should load tasks successfully in background") {
                    waitUntil(timeout: 3) { done in
                        viewModel.loadTasksAsync {
                            expect(viewModel.numberOfTasks).to(equal(2))
                            done()
                        }
                    }
                }
                
                it("should ensure tasks are updated on the main thread") {
                    waitUntil(timeout: 3) { done in
                        viewModel.loadTasksAsync {
                            expect(Thread.isMainThread).to(beTrue())
                            done()
                        }
                    }
                }
                
                it("should handle multiple async calls without race conditions") {
                    waitUntil(timeout: 5) { done in
                        viewModel.loadTasksAsync {}
                        viewModel.loadTasksAsync {}
                        
                        DispatchQueue.global().asyncAfter(deadline: .now() + 2.5) {
                            expect(viewModel.numberOfTasks).to(equal(2)) 
                            done()
                        }
                    }
                }
            }
        }
    }
}
