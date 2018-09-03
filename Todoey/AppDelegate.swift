//
//  AppDelegate.swift
//  Todoey
//
//  Created by Sabri Gurbuz on 8/22/18.
//  Copyright © 2018 Sabri Gurbuz. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
     
//       print(Realm.Configuration.defaultConfiguration.fileURL)
        
        // just to catch the error
        do {
             _ = try Realm()
        }
        catch {
            print("Error initializing new realm \(error)")
        }
        
        return true
    }


