//
//  CardView.swift
//  Scrumdinger
//
//  Created by luis armendariz on 11/2/23.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    
    var body: some View {
        VStack(alignment: .leading){
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack{
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(scrum.lengthInMinutes) minutes remaining")
                    .labelStyle(.trailingIcon)
            }
        }
        .padding()
        .foregroundStyle(scrum.theme.accentColor)
        .font(.caption)
        .frame(width: 400,height: 60)
    }
}

#Preview {
    CardView(scrum: DailyScrum.sampleData[0])
        .background(Color.yellow)
        .previewLayout(.fixed(width: 400, height: 60))
}
