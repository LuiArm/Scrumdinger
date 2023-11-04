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
            Spacer()
            HStack{
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .padding(.trailing,20)
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
