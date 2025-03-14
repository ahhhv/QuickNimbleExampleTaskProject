//
//  Task.swift
//  QuickNimbleProject
//
//  Created by Alex Hernández on 13/3/25.
//

import Foundation

// Modelo de Tarea
struct Task {
    let id: UUID = UUID()
    var title: String
    var isCompleted: Bool
}
