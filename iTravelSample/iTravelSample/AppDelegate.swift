//
//  AppDelegate.swift
//  iTravelSample
//
//  Created by Stanly Shiyanovskiy on 04.05.17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var coreDataStack = CoreDataStack()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().barStyle = .blackOpaque
        
        let defaults = UserDefaults.standard
        let isPreloaded = defaults.bool(forKey: "isPreloaded")
        if !isPreloaded {
            //copyFile(fileName: "test.sql")
            self.coreDataStack.preloadData()
            //defaults.set(true, forKey: "isPreloaded")
            print("ask to preload DB")
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        //self.coreDataStack.saveContext()
    }
}

//*********************

func getPath(fileName: String) -> String {
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent(fileName)
    return fileURL.path
}

func copyFile(fileName: NSString) {
    let dbPath: String = getPath(fileName: fileName as String)
    let fileManager = FileManager.default
    if !fileManager.fileExists(atPath: dbPath) {
        let documentsURL = Bundle.main.resourceURL
        let fromPath = documentsURL!.appendingPathComponent(fileName as String)
        var error : NSError?
        do {
            try fileManager.copyItem(atPath: fromPath.path, toPath: dbPath)
        } catch let error1 as NSError {
            error = error1
        }
    }
}


