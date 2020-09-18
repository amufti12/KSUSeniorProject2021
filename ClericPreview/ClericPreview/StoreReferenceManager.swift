import Foundation
import CareKit
import CareKitStore

// Singleton wrapper to hold a reference to OCKSynchronizedStoreManager and task identifiers
final class StoreReferenceManager {

    static let shared = StoreReferenceManager()
    
    // Manages synchronization of a CoreData store
    lazy var synchronizedStoreManager: OCKSynchronizedStoreManager = {
        let store = OCKStore(name: "ClericMain")
        let manager = OCKSynchronizedStoreManager(wrapping: store)
        return manager
    }()
    
    init() {}
}
