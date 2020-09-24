//
//  OCKFillButton.swift
//  
//
//  Created by Jason Bice on 9/17/20.
//

import SwiftUI
import Foundation

@available(iOS 14, *)
public struct OCKTaskFillBoxView: View {
    @ObservedObject var taskGroup: OCKTaskGroup
    @State var borderColor: Color
    @State var interiorColor: Color
    
    public var body: some View {
        VStack {
            //Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(interiorColor)
                    .frame(width: 50, height: 50, alignment: .center)
                
                
                Rectangle().fill(borderColor)
                    .frame(width: 50, height: 1, alignment: .bottom)
                    .scaleEffect(y: self.taskGroup.percentComplete, anchor: .bottom)
                    .offset(y: 25)
                
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(borderColor, lineWidth: 4)
                    .frame(width: 50, height: 50, alignment: .center)
                
                if (self.taskGroup.percentComplete == 50) {Image("checkmark").resizable().frame(width: 25, height: 25, alignment: .center)}
                
            }.clipShape(RoundedRectangle(cornerRadius: 10)).shadow(radius: 4)
            /*
            //Below this line in view for testing only
            Spacer()
            Button(action: {self.taskGroup.completeTask()}, label: {
                Text("Check Task Complete")
            })
            Button(action: {self.taskGroup.reduceCompleteTaskCount()}, label: {
                Text("Uncheck Task Complete")
            })
            Spacer()*/
        }
    }

@available(iOS 14, *)
struct OCKTaskFillBoxView_Previews: PreviewProvider {
    typealias Previews = OCKTaskFillBoxView
    
    static var previews = OCKTaskFillBoxView(taskGroup: myTaskGroup, borderColor: .green, interiorColor: .white)
    @StateObject static var myTaskGroup = OCKTaskGroup(taskTotal: 5)
    
    static var preview: some View {
        previews
        }
    }

}
