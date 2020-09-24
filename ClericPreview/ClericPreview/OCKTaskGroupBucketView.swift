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
public struct OCKTaskGroupBucketView: View {
    var taskGroupBucket: OCKTaskGroupBucket?
    var test = OCKTaskGroup(taskTotal: 6, taskComplete: 4)
    var test2 = OCKTaskGroup(taskTotal: 8, taskComplete: 3)
    var test3 = OCKTaskGroup(taskTotal: 2, taskComplete: 2)
    @State var selectedTaskGroup: OCKTaskGroup? = nil
    
    public var body: some View {
        //var visibleTasks = taskGroupBucket.viewableTaskBucket!
        let testBucket = [test, test2, test3, test2, test, test2, test2, test]
        
        ZStack {
            RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.systemGray6)).frame(maxWidth: 60, maxHeight: .infinity).shadow(radius: 2)
            ScrollView(showsIndicators: false) {
                Spacer()
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 100) {
                    Spacer()
                    ForEach(testBucket) {taskGroup in
                        Button(action: {selectedTaskGroup = taskGroup}, label: {
                            OCKTaskFillBoxView(taskGroup: taskGroup, borderColor: .green, interiorColor: .white)
                        })
                    }
                    Spacer()
                    Spacer()
                }
            }
        }.frame(width: 60, height: .infinity, alignment: .center).ignoresSafeArea()
    }
}

@available(iOS 14, *)
struct OCKTaskGroupBucketView_Previews: PreviewProvider {
    static var myTaskGroup = OCKTaskGroup(taskTotal: 3, taskComplete: 1)
    static var myTaskGroupBucket = OCKTaskGroupBucket(initialTaskGroup: myTaskGroup)
    
    //static var previews = OCKTaskGroupBucketView(taskGroupBucket: myTaskGroupBucket)
    static var previews = OCKTaskGroupBucketView()
    var Previews: some View {
        OCKTaskGroupBucketView_Previews.previews
    }
}*/
