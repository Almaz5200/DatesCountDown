//
//  AppDelegate.swift
//  DatesCountDown
//
//  Created by Artem Trubacheev on 20/03/2019.
//  Copyright © 2019 Artem Trubacheev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        DIContainer.configure()

        let navController = UINavigationController()
        navController.viewControllers = [MainBuilder.build()]

        window?.rootViewController = navController
        window?.makeKeyAndVisible()

        return true
    }

}
