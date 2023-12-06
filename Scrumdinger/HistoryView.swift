//
//  HistoryView.swift
//  Scrumdinger
//
//  Created by luis armendariz on 12/5/23.
//

import SwiftUI

struct HistoryView: View {
    let history: History
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Attendees")
                    .font(.headline)
                Text(history.attendeeString)
                if let transcript = history.transcript {
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                    Text(transcript)
                }
            }
        }
        .navigationTitle(Text(history.date,style: .date))
        .padding()
    }
}

extension History {
    var attendeeString: String {
        ListFormatter.localizedString(byJoining: attendees.map  {$0.name})
    }
}

//#Preview {
//    
//    HistoryView()
//}
