//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by luis armendariz on 11/11/23.
//

import SwiftUI

struct MeetingHeaderView: View {
    var body: some View {
        
        VStack{
            ProgressView(value: 5, total: 15)
            
            HStack{
                VStack(alignment: .leading){
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                
                Spacer()
                
                VStack(alignment: .trailing){
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time Remaining")
        .accessibilityValue("10 Minutes")  
    }
}

#Preview {
    MeetingHeaderView()
}
