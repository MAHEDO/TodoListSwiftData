//
//  ReminderListView.swift
//  TodoListSwiftData
//
//  Created by Aarón Hernandez Dominguez on 02/09/24.
//

import SwiftUI
import SwiftData

struct ReminderListView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var reminderList: ReminderList
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            HStack{
                Text(reminderList.name)
                Spacer()
                Text("\($reminderList.reminder.count)")
            }
            .font(.system(.largeTitle, design: .rounded))
            .foregroundColor(.primary)
            .padding(.horizontal)
            .bold()
            
            List {
                ForEach(reminderList.reminder){ reminders in
                    ReminderRowView(reminder: reminders)
                }
                .onDelete(perform: delete)
            }
            .listStyle(.inset)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItemGroup(placement: .bottomBar){
                Button{
                    reminderList.reminder.append(Reminder(name:""))
                } label: {
                    HStack(spacing: 7){
                        Image(systemName: "plus.circle.fill")
                        Text("New Reminder")
                    }
                    .font(.system(.body, design: .rounded))
                    .bold()
                    .foregroundColor(.primary)
                }
                Spacer()
            }
        }
    }
    
    func delete(_ IndexSet: IndexSet){
        for index in IndexSet{
            reminderList.reminder.remove(at: index)
        }
        try! modelContext.save()
    }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: ReminderList.self, configurations: config)
        let example = ReminderList(name: "Scheduled", iconName: "calendar", reminder: [Reminder(name: "Lunch whit Janet")])
        
        return ReminderListView(reminderList: example)
            .modelContainer(container)
    }catch{
        fatalError("Failed to create model container.")
    }
}
