//
//  SpeakerArc.swift
//  Scrumdinger
//
//  Created by luis armendariz on 11/25/23.
//

import SwiftUI

struct SpeakerArc: Shape {
    
    let speakerIndex: Int
    let totalSpeakers: Int
    
    private var degreesPerSpeaker: Double {
        360.0 / Double(totalSpeakers)
    }
    
    private var startAngle: Angle {
        Angle(degrees: degreesPerSpeaker * Double(speakerIndex) )
    }
    
    private var endAngle: Angle {
        Angle(degrees: startAngle.degrees + degreesPerSpeaker )
    }
    
    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
    
    
}
