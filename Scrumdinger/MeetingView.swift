//
//  ContentView.swift
//  Scrumdinger
//
//  Created by luis armendariz on 10/31/23.
//

import SwiftUI

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    
    //source of truth
    @StateObject var scrumTimer = ScrumTimer()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
        VStack {
            MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
            
            Circle()
                .strokeBorder(lineWidth: 24)
            HStack{
                Text("Speaker 1 of 3")
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next Speaker")
            }
        }
    }
    .padding()
    .foregroundStyle(Color(scrum.theme.accentColor))
    .onAppear{
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
        scrumTimer.startScrum()
    }
    .onDisappear{
        scrumTimer.stopScrum()
    }
    .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
}
