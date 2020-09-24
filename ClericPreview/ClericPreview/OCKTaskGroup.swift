//
//  TaskGroup.swift
//  
//
//  Created by Jason Bice on 9/18/20.
//

import SwiftUI
import Foundation
/*
@available(iOS 14, *)
public class OCKTaskGroup: ObservableObject, Equatable, Identifiable {
    public static func == (lhs: OCKTaskGroup, rhs: OCKTaskGroup) -> Bool {
        return lhs.id == rhs.id
    }

    //TODO - Determine the data available for a task group
    @Published var percentComplete: CGFloat = 0
    let completeAll: Bool?
    @Published var taskTotal: Int
    @Published var taskComplete: Int?
    var taskList: [OCKDynamicTask<some View>]
    public let id: UUID
    
    init(
        percentComplete: CGFloat? = nil,
        completeAll: Bool? = nil,
        taskTotal: Int? = nil,
        taskComplete: Int? = nil,
        //TODO - Solution for when this needs to be multiple task types.
        taskList: [OCKDynamicTask]
    {
        
        self.completeAll = completeAll
        self.taskComplete = taskComplete ?? 0
        self.taskData = taskData
        self.dataManager = dataManager
        self.id = UUID()
        self.taskList = taskList
        self.taskTotal = taskTotal ?? taskList.count
        self.percentComplete = completionPercentage()
        
    }
    
    //TODO - Connect to a group of tasks
    func completionPercentage() -> CGFloat {
        let percent = CGFloat((Double(taskComplete ?? 0) / Double(taskTotal)) * 50)
        return percent
    }
    
    func completeTask() {
        if self.taskComplete == nil{
            self.taskComplete = 0
        }
        if self.taskComplete! < self.taskTotal {
            self.taskComplete! += 1
            self.percentComplete = completionPercentage()
        }
    }
    
    func reduceCompleteTaskCount() {
        assert(self.taskComplete != nil)
        if self.taskComplete! > 0 && self.taskComplete! <= self.taskTotal {
            self.taskComplete! -= 1
            self.percentComplete = completionPercentage()
        }
    }
    
    func addTask() {
        //TODO - Adds a specific task to a task group and update
        //associated variable
        //Need to determine how tasks will be managed - CareKit Store implementation or custom for demo app.
    }
    
    func removeTask() {
        //TODO - similar to above but removes a task from a group. 
    }
}*/
