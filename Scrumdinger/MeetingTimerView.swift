//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by luis armendariz on 11/23/23.
//

import SwiftUI

struct MeetingTimerView: View {
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                Text("Plaaceholder")
            }
    }
}

#Preview {
    MeetingTimerView()
}
