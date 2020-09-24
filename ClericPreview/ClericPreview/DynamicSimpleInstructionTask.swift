//
//  DynamicSimpleInstructionTask.swift
//  ClericPreview
//
//  Created by Jason Bice on 9/24/20.
//

import Foundation
import SwiftUI

public class DynamicSimpleInstructionTask: OCKDynamicTask {
        
    public var instruction: String
    public var continueGenerateTask: Bool
    @Published var followUpTask: OCKDynamicTask?
    @Published var taskComplete: Bool = false
    
    init(title: String,
         generatesTask: Bool,
         id: UUID,
         instruction: String,
         continueGenerateTask: Bool,
         taskComplete: Bool)
    {
        self.instruction = instruction
        self.continueGenerateTask = continueGenerateTask
        self.taskComplete = taskComplete
        super.init(title: title, generatesTask: generatesTask , id: id)
        
    }
     
    func updateTaskComplete() {
        taskComplete.toggle()
    }
    
    override func dynamicAction() -> OCKDynamicTask? {
        if generatesTask && continueGenerateTask {
            //Code for building a new task here
            if followUpTask != nil {
                //code here to be replaced with details from a generate task class
                let newTask = followUpTask
            
                //toggle continue generate task to prevent repeate task generation
                continueGenerateTask.toggle()
                return newTask!
            }
        }
        return nil
    }
}
