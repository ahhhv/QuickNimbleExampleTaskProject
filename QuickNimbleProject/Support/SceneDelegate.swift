//
//  SceneDelegate.swift
//  QuickNimbleProject
//
//  Created by Alex Hernández on 13/3/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let navController = UINavigationController(rootViewController: TaskListViewController())
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
