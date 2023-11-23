//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by luis armendariz on 11/23/23.
//

import SwiftUI

struct MeetingTimerView: View {
    let speakers: [ScrumTimer.Speaker]
    let theme: Theme
    
    private var currentSpeaker: String {
        speakers.first(where: {!$0.isCompleted})?.name ?? "Someone"
        
    }
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                VStack{
                    Text(currentSpeaker)
                        .font(.title)
                    Text("is speaking")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(Color(theme.accentColor))
            }
    }
}

#Preview {
     var speakers: [ScrumTimer.Speaker] {
           [ScrumTimer.Speaker(name: "Bill", isCompleted: true), ScrumTimer.Speaker(name: "Cathy", isCompleted: false)]
       }
    
    MeetingTimerView(speakers: speakers, theme: .yellow)
}
