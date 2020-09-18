//
//  DefaultSceneDelegate.swift
//  ClericApp
//
//  Created by Jason Bice on 9/04/20.
//

import CareKit
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        let appDelegate = UIApplication.shared.delegate as! DefaultAppDelegate
        let manager = appDelegate.synchronizedStoreManager!
        let careViewController = UINavigationController(rootViewController: TempViewController(storeManager: manager))
        
        let permissionViewController = UIViewController()
        permissionViewController.view.backgroundColor = .green
        if let windowScene = scene as? UIWindowScene {
            window = UIWindow(windowScene: windowScene)
            window?.rootViewController = permissionViewController
            window?.tintColor = UIColor { $0.userInterfaceStyle == .light ? #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1) : #colorLiteral(red: 0.8627432641, green: 0.2630574384, blue: 0.2592858295, alpha: 1) }
            window?.makeKeyAndVisible()

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                appDelegate.healthKitStore.requestHealthKitPermissionsForAllTasksInStore { _ in
                    DispatchQueue.main.async {
                        self.window?.rootViewController = careViewController
                    }
                }
            }
        }
    }
}
