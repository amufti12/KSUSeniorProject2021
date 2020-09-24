//
//  TaskGroup.swift
//  
//
//  Created by Jason Bice on 9/18/20.
//

import SwiftUI
import Foundation

class TaskGroup: ObservableObject, Equatable {
    static func == (lhs: TaskGroup, rhs: TaskGroup) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    //TODO - Determine the data available for a task group
    @Published var percentComplete: CGFloat = 0
    let completeAll: Bool?
    @Published var taskTotal: Int?
    @Published var taskComplete: Int?
    let taskData: Bool?
    let dataManager: Bool?
    let identifier: UUID
    
    init(
        percentComplete: CGFloat? = nil,
        completeAll: Bool? = nil,
        taskTotal: Int? = nil,
        taskComplete: Int? = nil,
        //Task Data and dataManager will have their own data type coming from a data store.
        //Data store details dependant on task implementation (Standard Task cards grouped, or from in development tool)
        taskData: Bool? = nil,
        dataManager: Bool? = nil){
        
        self.percentComplete = percentComplete ?? 0
        self.completeAll = completeAll
        self.taskTotal = taskTotal ?? 1
        self.taskComplete = taskComplete ?? 0
        self.taskData = taskData
        self.dataManager = dataManager
        self.identifier = UUID()
        
    }
    
    //TODO - Connect to a group of tasks
    func completionPercentage() -> CGFloat {
        let percent = CGFloat((Double(taskComplete ?? 0) / Double(taskTotal ?? 1)) * 50)
        return percent
    }
    
    func completeTask() {
        if self.taskComplete == nil{
            self.taskComplete = 0
        }
        if self.taskComplete! < self.taskTotal! {
            self.taskComplete! += 1
            self.percentComplete = completionPercentage()
        }
    }
    
    func reduceCompleteTaskCount() {
        assert(self.taskComplete != nil)
        if self.taskComplete! > 0 && self.taskComplete! <= self.taskTotal! {
            self.taskComplete! -= 1
            self.percentComplete = completionPercentage()
        }
    }
    
    func noAction() {
        return
    }
}
