//
//  TaskView.swift
//  ToDoApp
//
//  Created by user222882 on 11/20/22.
//

import SwiftUI

struct TaskView: View {
    var description: String
    
    var body: some View {
        if (description == "Feed me please!") {
            Image("corgi")
                .resizable()
                .frame(width: 300, height: 160)
                .padding()
            Text(description)
        } else if (description == "Let`s do some magic.") {
            Image("coding")
                .resizable()
                .frame(width: 300, height: 300)
                .padding()
            Text(description)
        } else {
            Image("question")
                .resizable()
                .frame(width: 300, height: 300)
                .padding()
            Text(description)
        }
        
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(description: "Text")
    }
}
