//
//  ContentView.swift
//  Scrumdinger
//
//  Created by luis armendariz on 10/31/23.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    
    //source of truth
    @StateObject var scrumTimer = ScrumTimer()
    
    //The initializer requests access to the speech recognizer and microphone the first time that the system calls the object.
    @StateObject var speechRecognizer = SpeechRecognizer()
    
    @State private var isRecording = false
    
    private var player: AVPlayer { AVPlayer.sharedDingPlayer}
    
    //func to start timer for new scrum
    private func startScrum() {
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
        scrumTimer.speakerChangedAction = {
            player.seek(to: .zero)
            player.play()
        }
        speechRecognizer.resetTranscript()
        speechRecognizer.startTranscribing()
        isRecording = true
        let newHistory = History(attendees: scrum.attendees, transcript: speechRecognizer.transcript)
        scrumTimer.startScrum()
    }
    
    // func to end timer and to history array
    private func endScrum() {
        scrumTimer.stopScrum()
        speechRecognizer.stopTranscribing()
        isRecording = false
        let newHistory = History(attendees: scrum.attendees)
        scrum.history.insert(newHistory, at: 0)
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
        VStack {
            MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
            
            MeetingTimerView(speakers: scrumTimer.speakers, isRecording: isRecording, theme: scrum.theme)
            MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
        }
    }
    .padding()
    .foregroundStyle(Color(scrum.theme.accentColor))
    .onAppear{
       startScrum()
    }
    .onDisappear{
        endScrum()
    }
    .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
}
