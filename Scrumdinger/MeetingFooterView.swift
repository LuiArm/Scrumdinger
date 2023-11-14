//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by luis armendariz on 11/13/23.
//

import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    var skipAction: ()->Void
    
    // this computed property determines speaker number
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted}) else {return nil}
        return index + 1
    }
    
    // this computed property checks if active speaker is the last speaker
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }
    
    //computed property returns info about active speaker
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else {return "No more speakers."}
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    
    var body: some View {
        VStack {
            HStack{
                if isLastSpeaker {
                  Text("Last Speaker")
                }else {
                    Text(speakerText)
                    
                    Spacer()
                    
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next Speaker")
                }
              
            }
        }
        .padding([.horizontal,.bottom])
    }
}

#Preview {
    MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
        .previewLayout(.sizeThatFits)
}
