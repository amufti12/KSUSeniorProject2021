//
//  DynamicSimpleInstructionTask.swift
//  ClericPreview
//
//  Created by Jason Bice on 9/24/20.
//

import Foundation
import SwiftUI

public class DynamicSimpleInstructionTask: OCKDynamicTask {
    private let generatorOptions = [1: OCKDynamicSimpleInstructionTaskGenerator.self]
    public var instruction: String
    public var continueGenerateTask: Bool? = false
    public var generator: Int
    @Published var taskComplete: Bool = false
    
    init(title: String,
         generatesTask: Bool,
         id: UUID,
         instruction: String,
         continueGenerateTask: Bool?,
         generator: Int,
         taskComplete: Bool)
    {
        self.instruction = instruction
        self.continueGenerateTask = continueGenerateTask ?? false
        self.generator = generator
        self.taskComplete = taskComplete
        super.init(title: title, generatesTask: generatesTask , id: id)
        
    }
     
    func updateTaskComplete() {
        taskComplete.toggle()
    }
    
    override func dynamicAction() -> OCKDynamicTask? {
        let myGenerator = generatorOptions[generator]!.init(id: id, title: "Test", instruction: "Stuff", previousTask: self)
        let newTask = myGenerator?.generateTask()
        return newTask
    }
}
