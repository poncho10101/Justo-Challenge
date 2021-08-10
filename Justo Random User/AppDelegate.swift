//
//  AppDelegate.swift
//  Justo Random User
//
//  Created by Admin on 09/08/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    static var rootNavigationController: UINavigationController?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let rootModule = UserListRouter.createUserListModule()
        
        let _ = setUpWindow([rootModule])
        
        return true
    }
    
    func setUpWindow(_ viewControllers: [UIViewController]) -> UIWindow? {
        let navigationController = UINavigationController()
        navigationController.viewControllers = viewControllers
        AppDelegate.rootNavigationController = navigationController
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return window
    }


}

