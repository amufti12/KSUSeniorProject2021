//
//  OCKTaskGenerator.swift
//  ClericPreview
//
//  Created by Jason Bice on 9/24/20.
//

import Foundation

//Parent class for all generators
public class OCKTaskGenerator: ObservableObject, Identifiable, Equatable {
    public let id: UUID?
    
    public static func == (lhs: OCKTaskGenerator, rhs: OCKTaskGenerator) -> Bool {
        return lhs.id == rhs.id
    }
    
    init(id: UUID?)
    {
        self.id = UUID()
    }
    
    func generateTask() -> OCKDynamicTask? {
        fatalError("Must override function")
    }
    
}
