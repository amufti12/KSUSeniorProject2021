//
//  OCKDynamicTask.swift
//  ClericPreview
//
//  Created by Jason Bice on 9/21/20.
//

import Foundation
import SwiftUI
/*
public struct OCKDynamicTask<Content: View>: View {
    public var title: String
    public var subTitle: String?
    public var detailLink: Bool = true
    public var dynamicLogic: Bool = false
    public var logicVariables: [Any] = []
    public let content: Content
    public let id = UUID()
    init(
        title: String,
        subTitle: String? = nil,
        detailLink: Bool = true,
        logicVariables: [Any] = [],
        @ViewBuilder content: () -> Content) {
        
        self.title = title
        self.subTitle = subTitle ?? ""
        self.detailLink = detailLink
        self.logicVariables = logicVariables
        self.content = content()
    }
    
    public var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(title)").bold()
                    Text("\(subTitle ?? "")")
                    Divider()
                }.padding()
                Spacer()
                if detailLink { Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "chevron.right").padding()
                    })
                }
            }
            self.content
                .padding()
        }.frame(width: .infinity, height: .infinity, alignment: .center).background(Color.white).cornerRadius(5).shadow(radius: 3).padding()
    }
    
    //Override this function to attach logic to the task view for creation of other tasks.
    func dynamicLogic(_ variables:[Any] ) {
        return
    }
}

struct OCKDynamicTask_Preview: PreviewProvider {
    static var myContent = SimpleInstructionTask(instructionText: "It's time you started listening to instructions. Now go jump on your bed!")
    static var previews = OCKDynamicTask(title: "Example Task View"){myContent}
    var Previews: some View {
        OCKDynamicTask_Preview.previews
    }
}*/

public class OCKDynamicTask: ObservableObject, Equatable, Identifiable {
    //Making the class confrom to Equatable and Identifiable
    public static func == (lhs: OCKDynamicTask, rhs: OCKDynamicTask) -> Bool {
        return lhs.id == rhs.id
    }
    public let title: String
    public let id: UUID
    
    init(title: String, id: UUID) {
        self.title = title
        self.id = UUID()
    }
    
    func dynamicAction() {
        fatalError("Must Override Function")
    }
}
