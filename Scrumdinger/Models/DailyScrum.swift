//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by luis armendariz on 11/2/23.
//

import Foundation


struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    //Adding double-precision representation of scrums length to bind to slider
    var lengthInMinutesAsDouble: Double {
        //getter that returns the length of a scrum as a double
        get {
            Double(lengthInMinutes)
        }
        // slider changes value of lengthInMinutesAsDouble, convert double to Int, and update lengthInMinutes property
        set {
            lengthInMinutes = Int(newValue)
        }
    }
    var theme: Theme
    
    
    //initializer to assign default value to id property
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0)}
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

// Scrum attendees
extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        let name: String
        
        //initializer to assign default value to id property
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    //empty scrum

     static var emptyScrum: DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
    }

}



// Sample data for daily scrum

extension DailyScrum {
    //array of daily scrums
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design",
                   attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
                   lengthInMinutes: 10,
                   theme: .yellow),
        DailyScrum(title: "App Dev",
                   attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
                   lengthInMinutes: 5,
                   theme: .orange),
        DailyScrum(title: "Web Dev",
                   attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
                   lengthInMinutes: 5,
                   theme: .poppy)
    ]
    
}
