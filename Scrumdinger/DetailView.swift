//
//  DetailView.swift
//  Scrumdinger
//
//  Created by luis armendariz on 11/7/23.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    
    @State private var editingScrum = DailyScrum.emptyScrum
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView(scrum: $scrum)){
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundStyle(Color(scrum.theme.mainColor))
                }
                
                HStack{
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes)")
                }
                .accessibilityElement(children: .combine)
                
                HStack{
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundStyle(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .clipShape(.rect(cornerRadius: 4))
                }
                .accessibilityElement(children: .combine)
            }
            
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar{
            Button("Edit"){
                isPresentingEditView = true
                editingScrum = scrum
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack{
                DetailEditView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction){
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        
                        ToolbarItem(placement: .confirmationAction){
                            Button("Done"){
                                isPresentingEditView = false
                                scrum = editingScrum
                            }
                        }
                    }
            }
        }
    }
}

//struct DetailView: View {
//    let scrum: DailyScrum
//    
//    @State private var isPresentingEditView = false
//    
//    var body: some View {
//        List {
//            Section(header: Text("Meeting Info")) {
//                NavigationLink(destination: MeetingView()) {
//                    Label("Start Meeting", systemImage: "timer")
//                        .font(.headline)
//                        .foregroundColor(.accentColor)
//                }
//                HStack {
//                    Label("Length", systemImage: "clock")
//                    Spacer()
//                    Text("\(scrum.lengthInMinutes) minutes")
//                }
//                .accessibilityElement(children: .combine)
//                HStack {
//                    Label("Theme", systemImage: "paintpalette")
//                    Spacer()
//                    Text(scrum.theme.name)
//                        .padding(4)
//                        .foregroundColor(scrum.theme.accentColor)
//                        .background(scrum.theme.mainColor)
//                        .cornerRadius(4)
//                }
//                .accessibilityElement(children: .combine)
//            }
//            Section(header: Text("Attendees")) {
//                ForEach(scrum.attendees) { attendee in
//                    Label(attendee.name, systemImage: "person")
//                }
//            }
//        }
//        .navigationTitle(scrum.title)
//        .toolbar {
//            Button("Edit") {
//                isPresentingEditView = true
//            }
//        }
//        .sheet(isPresented: $isPresentingEditView) {
//            NavigationStack {
//                DetailEditView()
//                    .navigationTitle(scrum.title)
//                    .toolbar {
//                        ToolbarItem(placement: .cancellationAction) {
//                            Button("Cancel") {
//                                isPresentingEditView = false
//                            }
//                        }
//                        ToolbarItem(placement: .confirmationAction) {
//                            Button("Done") {
//                                isPresentingEditView = false
//                            }
//                        }
//                    }
//            }
//        }
//    }
//}
//
//
//



#Preview {
    NavigationStack {
        DetailView(scrum: .constant(DailyScrum.sampleData[0]))
    }
    
}