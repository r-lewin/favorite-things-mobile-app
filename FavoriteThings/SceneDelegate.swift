//
//  SceneDelegate.swift
//  FavoriteThings
//
//  Created by Ryan Lewin on 18/4/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//

import UIKit
import SwiftUI
import CoreData

private let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask) //Accessed the file path and stored in var for later use
private let documentFolderURL = urls.first!//Accessed the file path and stored in var for later use

private let fileURL = documentFolderURL.appendingPathComponent("fruits.json") //Finishes path to txt file with file name

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("No app delegate")
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        var sampleItemList = [Item_list]()
        var request: NSFetchRequest<Item_list> = Item_list.fetchRequest()
        var sort = NSSortDescriptor(key: "title", ascending: false)
        var count = 0
        
        do {
            sampleItemList = try context.fetch(request)
            print("Got \(sampleItemList.count) item lists")
            count = sampleItemList.count
        } catch {
            print("Fetch failed")
        }
        
        func createDummyData() {
            let ent = NSEntityDescription.entity(forEntityName: "Item_list", in: context)
            let testEnt = NSManagedObject(entity: ent!, insertInto: context)
            testEnt.setValue("New Sample List", forKey: "title")
            let itemEnt = NSEntityDescription.entity(forEntityName: "Item", in: context)
            for _ in 1...4{
                let testItemEnt = NSManagedObject(entity: itemEnt!, insertInto: context)
                testItemEnt.setValue(testEnt, forKey: "stored_in")
            }
            do {
                try context.save()
                print("Saved")
            } catch {
                print("Error, not saved")
            }
        }
        
        
        if count < 1 {
            createDummyData()
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
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

