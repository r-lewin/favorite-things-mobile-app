//
//  SceneDelegate.swift
//  FavoriteThings
//
//  Created by Ryan Lewin on 18/4/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//

import UIKit
import SwiftUI

private let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask) //Accessed the file path and stored in var for later use
private let documentFolderURL = urls.first!//Accessed the file path and stored in var for later use

private let fileURL = documentFolderURL.appendingPathComponent("fruits.json") //Finishes path to txt file with file name

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var fruitDir = FruitDirectory()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("No app delegate")
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        // Sets up decoder and uses it to decode JSON data stoored in fileURL
        do{
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let decodedFruits = try decoder.decode(FruitDirectory.self, from: data)
            fruitDir = decodedFruits // initialises fruitDir with decoded data
        } catch {
            print("Got \(error)")
        }
        
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView().environment(\.managedObjectContext, context)

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
        // Sets up encoder to be use when scene is suspended - writes encoded data to fileURL to offer persistent data
        do {
          let json = JSONEncoder()
          let data = try json.encode(fruitDir)
          try data.write(to: fileURL)
        } catch {
          print("Got \(error)")
        }
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

