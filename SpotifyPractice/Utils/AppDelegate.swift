//
//  AppDelegate.swift
//  SpotifyPractice
//
//  Created by Apple New on 2022-04-26.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        if AuthManger.shared.isSignedIn{
            AuthManger.shared.refreshIfNeeded(completion: nil)
            window.rootViewController =  TabBarViewController()
            print("if")
        }
        else{
            print("else A")
            let navVC = UINavigationController(rootViewController: WelcomViewController())
            navVC.navigationBar.prefersLargeTitles = true
            navVC.viewControllers.first?.navigationItem.largeTitleDisplayMode = .always
            window.rootViewController = navVC
        }

        window.makeKeyAndVisible()
        self.window = window
        
//        AuthManger.shared.refreshIfNeeded { success in
//            print(success)
//        }
        
        print(AuthManger.shared.signInURL?.absoluteString ?? "Error")
        
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

