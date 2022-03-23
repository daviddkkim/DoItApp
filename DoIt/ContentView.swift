//
//  ContentView.swift
//  DoIt
//
//  Created by Dong Kyun Kim on 3/22/22.
//

import SwiftUI

struct Task: Hashable, Identifiable {
    var id = UUID();
    var description: String;
    var done = false;
}

struct ContentView: View {
    var body: some View {
        NavigationView{
            List {
                Label("Task", systemImage: "largecircle.fill.circle")

                Label("Stats", systemImage: "chart.bar.xaxis")
                Divider()
                Text("Folders").font(.caption   )
                Label("New", systemImage: "plus")
            }
        
        .listStyle(SidebarListStyle())
        .frame(minWidth: 100, idealWidth: 300, maxWidth: 350, maxHeight: .infinity)
            
            TasksList()
        }
    }
}

struct TasksList: View {
    @State var tasks = [
        Task(description: "Item 1"),
        Task(description: "Item 2"),
        Task(description: "Item 3"),
    ]
    
    var body: some View{
        List{
            VStack( alignment: .leading, spacing: 10) {
                ForEach(tasks) { task in
                    Text(task.description)
                }
                
            }
            }.navigationTitle("Todo App").toolbar { ToolbarItem(placement: .status){
            Button(action: {tasks.append(Task(description: "New Item"))}) {
                Image(systemName: "plus")
            }
        } }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
