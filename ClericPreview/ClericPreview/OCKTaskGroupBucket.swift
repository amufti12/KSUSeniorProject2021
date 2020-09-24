//
//  File.swift
//  
//
//  Created by Jason Bice on 9/18/20.
//


import Foundation
import SwiftUI
/*
@available(iOS 14, *)
public class OCKTaskGroupBucket: ObservableObject {
    @Published var initialTaskGroup: OCKTaskGroup?
    @Published var taskBucket: [OCKTaskGroup]?
    @Published var viewableTaskBucket: [OCKTaskGroup]?
    @Published var activeTaskIndex: Int?
    @Published var activeTaskGroup: OCKTaskGroup?
    @State private var fullViewableTaskBucket: Bool = false
    @State private var centerIndex: Int = 0
    
    init(
        initialTaskGroup: OCKTaskGroup? = nil,
        taskBucket: [OCKTaskGroup]? = nil,
        viewableTaskBucket: [OCKTaskGroup]? = nil,
        activeTaskIndex: Int? = nil,
        activeTaskGroup: OCKTaskGroup? = nil ) {
        
        if (self.initialTaskGroup != nil) {
            self.taskBucket = [self.initialTaskGroup!]
            setCenterIndex(0)
            self.activeTaskIndex = 0
            self.activeTaskGroup = self.viewableTaskBucket![self.activeTaskIndex!]
        } else {
            setWithInitialTaskGroup(OCKTaskGroup(taskTotal: 1))
        }
        
    }
    
    func setWithInitialTaskGroup(_ aTaskGroup: OCKTaskGroup) {
        self.initialTaskGroup = aTaskGroup
        self.taskBucket = [initialTaskGroup!]
        setCenterIndex(0)
        self.activeTaskIndex = 0
        self.activeTaskGroup = self.viewableTaskBucket![self.activeTaskIndex!]
    }
    
    func addTaskGroup(_ newTaskGroup: OCKTaskGroup) {
        self.taskBucket?.append(newTaskGroup)
        checkBucketFill()
    }
    
    func removeTaskGroup(_ removalGroup: OCKTaskGroup) {
        self.taskBucket = taskBucket?.filter { $0 !== removalGroup}
        checkBucketFill()
    }
    
    func setCenterIndex(_ index: Int) {
        assert(taskBucket != nil)
        assert(index >= 0 && index <= taskBucket!.count - 3)
        self.centerIndex = index
        updateViewableTaskBucket()
    }
    
    func checkBucketFill() {
        assert(taskBucket != nil)
        (taskBucket!.count >= 5 ? (self.fullViewableTaskBucket = true) : (self.fullViewableTaskBucket = false))
        
    }
    
    private func updateViewableTaskBucket() {
        checkBucketFill()
        (fullViewableTaskBucket ? (self.viewableTaskBucket = Array(taskBucket![(self.centerIndex - 2)...(self.centerIndex + 2)])) : (self.viewableTaskBucket = taskBucket!))
    }
    
    func setActiveTaskGroup(_ activeIndex: Int) {
        assert(0 <= activeIndex && activeIndex < viewableTaskBucket!.count)
        assert(viewableTaskBucket != nil)
        self.activeTaskGroup = viewableTaskBucket![activeIndex]
    }
    
    func setActiveTaskGroup(_ touchGroup: OCKTaskGroup) {
        assert(viewableTaskBucket!.contains(touchGroup))
        self.activeTaskGroup = touchGroup
    }
}*/
