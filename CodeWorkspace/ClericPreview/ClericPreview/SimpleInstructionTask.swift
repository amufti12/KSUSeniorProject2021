//
//  SimpleInstructionTask.swift
//  ClericPreview
//
//  Created by Jason Bice on 9/21/20.
//

import Foundation
import SwiftUI

struct SimpleInstructionTask: View {
    var instructionText: String?
    var incompleteLabel: String = "Mark as Complete"
    var completeLabel: String = "Completed"
    @State var taskComplete: Bool = false
    
    var body: some View {
        VStack {
            Text("\(instructionText ?? "")")
            Button(action: {self.taskComplete.toggle()}, label: {
                taskComplete ?
                    
                    Text("\(completeLabel)")
                    .padding()
                    .foregroundColor(Color(UIColor.systemRed))
                    .background(Color(UIColor.systemGray5))
                    .frame(width: .infinity, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10) :
                    
                    Text("\(incompleteLabel)")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color(UIColor.systemRed))
                    .frame(width: .infinity, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
            })
        }
    }
}

struct SimpleInstructionTask_Preview: PreviewProvider {
    static var previews = SimpleInstructionTask(instructionText: "Lorem Ipsum Ain't it Cool.")
    var Previews: some View {
        SimpleInstructionTask_Preview.previews
    }
}
