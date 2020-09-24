//
//  OCKDynamicTaskContentView.swift
//  ClericPreview
//
//  Created by Jason Bice on 9/21/20.
//

import Foundation
import SwiftUI

struct OCKDynamicTaskContentView<Content: View>: View {
    let content: Content

        init(@ViewBuilder content: () -> Content) {
            self.content = content()
        }
    
    var body: some View {
        self.content
            .padding()
    }
}
