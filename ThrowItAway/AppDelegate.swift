//
//  AppDelegate.swift
//  ThrowItAway
//
//  Created by Polina Polukhina on 26.04.2020.
//  Copyright © 2020 Polina Polukhina. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let productListViewController = ProductListViewController() as UIViewController
        let navigationController = UINavigationController(rootViewController: productListViewController)
        navigationController.navigationBar.isTranslucent = false
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }

}
