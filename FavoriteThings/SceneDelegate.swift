//
//  SceneDelegate.swift
//  FavoriteThings
//
//  Created by Ryan Lewin on 18/4/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var fruitDir = FruitDirectory(fruits: [])


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        fruitDir.addFruit(name: "Banana", family: "Musaceae", genus: "Musa", picURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTKZU95zY7wh2okDgLdgKYRQb45BJ1uKuGTtjtmwdo3zc1xai2d&usqp=CAU")

        fruitDir.addFruit(name: "Pineapple", family: "Bromeliaceae", genus: "Ananas", picURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQWRAnMgTkBLcYtAQEPtFJ-r8bkdZxyeUWcbzm0_o1zZbF4Sl1e&usqp=CAU")

        fruitDir.addFruit(name: "Mandarin", family: "Rutaceae", genus: "Citrus", picURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRXAUV5aeLODH6z05M6Daf6uIX13RNbwtpJT1FWDBntm2jPTOcJ&usqp=CAU")

        fruitDir.addFruit(name: "Mango", family: "Anacardiaceae", genus: "Mangifera", picURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTNo5ymn3vc5dWd0Lk997QkHWr15B94qCo8es4LZDR6XuFf3k_9&usqp=CAU")

        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView(fruitDir: fruitDir)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

