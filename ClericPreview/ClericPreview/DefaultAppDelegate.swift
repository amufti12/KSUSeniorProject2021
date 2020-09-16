//
//  DefaultAppDelegate.swift
//  ClericPreview
//
//  Created by Jason Bice on 9/03/20.
//

import CareKit
import CareKitStore
import Contacts
import UIKit
import HealthKit

@UIApplicationMain
class DefaultAppDelegate: UIResponder, UIApplicationDelegate {
    
    let coreDataStore = OCKStore(name: "ClericMainStore", type: .onDisk)
    let healthKitStore = OCKHealthKitPassthroughStore(name: "ClericHealthKitPassthroughStore", type: .onDisk)
    private(set) var synchronizedStoreManager: OCKSynchronizedStoreManager!
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let coordinator = OCKStoreCoordinator()
        coordinator.attach(eventStore: healthKitStore)
        coordinator.attach(store: coreDataStore)

        synchronizedStoreManager = OCKSynchronizedStoreManager(wrapping: coordinator)

        return true
    }

    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
