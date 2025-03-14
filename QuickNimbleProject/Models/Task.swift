import UIKit

// Modelo de Tarea
struct Task {
    let id: UUID = UUID()
    var title: String
    var isCompleted: Bool
}