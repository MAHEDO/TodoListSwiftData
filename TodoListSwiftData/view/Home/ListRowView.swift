//
//  ListRowView.swift
//  TodoListSwiftData
//
//  Created by Aarón Hernandez Dominguez on 02/09/24.
//

import SwiftUI
import SwiftData

struct ListRowView: View {
    @Bindable var reminderList: ReminderList
    
    var body: some View {
        HStack{
            listIcon
            Text(reminderList.name)
            Spacer()
            Text("\(reminderList.reminder.count)")
        }
    }
    
    var listIcon: some View{
        ZStack{
            Circle()
                .fill(.primary)
                .frame(width: 27)
            Image(systemName: reminderList.iconName)
                .font(.footnote)
                .foregroundColor(.white)
                .bold()
        }
    }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: ReminderList.self, configurations: config)
        let example = ReminderList(name: "App test", iconName: "iphone", reminder: [Reminder(name: "Talk to some"), Reminder(name: "Collet bounty")])
        
        return ListRowView(reminderList: example)
            .modelContainer(container)
    }catch {
        fatalError("Failed to create model container")
    }
}
