//
//  OCKDynamicSimpleInstructionTaskGenerator.swift
//  ClericPreview
//
//  Created by Jason Bice on 9/24/20.
//

import Foundation

public class OCKDynamicSimpleInstructionTaskGenerator: OCKTaskGenerator {
    let title: String
    let instruction: String
    
    init(id: UUID, title: String, instruction: String, previousTask: DynamicSimpleInstructionTask) {
        self.title = title
        self.instruction = instruction
        super.init(id: id)
    }
    
    override func generateTask() -> OCKDynamicTask? {
        let newTask = DynamicSimpleInstructionTask(title: title, generatesTask: true, id: id, instruction: instruction, continueGenerateTask: false, generator: 1, taskComplete: false)
        return newTask
    }
}
