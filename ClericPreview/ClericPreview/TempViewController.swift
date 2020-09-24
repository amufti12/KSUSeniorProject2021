//
//  TempViewController.swift
//  ClericApp
//
//  Created by Jason Bice on 9/03/20.
//

import Foundation
import UIKit
import CareKit
import CareKitStore
import SwiftUI

struct PageViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> OCKDailyPageViewController {
        let view = TempViewController(storeManager: StoreReferenceManager().synchronizedStoreManager)
        return view
    }
    
    func updateUIViewController(_ uiViewController: OCKDailyPageViewController, context: Context) {
        //TODO
    }
    
}

final class TempViewController: OCKDailyPageViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cleric" //TODO - replace with dynamic current family member name
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profiles", style: .plain, target: self, action: #selector(presentFamilyProfiles))
    }
    
    @objc private func presentFamilyProfiles() {
        //TODO - Create View controller for holding multiple family member profiles.
    }
    
}

struct TempViewController_Previews: PreviewProvider {
    static var previews: some View {
        PageViewController()
    }
}
