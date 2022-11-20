//
//  ContentView.swift
//  ToDoApp
//
//  Created by user222882 on 11/20/22.
//

import SwiftUI

struct ContentView: View {
    @State var isDone: Bool = false
    
    struct Task : Identifiable {
        let id = UUID()
        let title: String
        let description: String
    }
    
    let tasks = [
        Task(title: "Feed your dog!", description: "Feed me please!"),
        Task(title: "Create a ToDo App", description: "Let`s do some magic."),
        Task(title: "Some task", description: "This is some task")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    HStack{
                        NavigationLink(task.title, destination: TaskView(description: task.description))
                            .swipeActions(allowsFullSwipe: false) {
                                Button(role: .destructive) {
                                    print("Deleting task!")
                                } label: {
                                    Label("Delete", systemImage: "trash.fill")
                                }
                            }
                        Toggle(isOn: $isDone, label: {
                            Text("")
                        })
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
