//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by luis armendariz on 10/31/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        //views added to WindowGroup scene builder are presented in a window that fills the devices entire screen
        WindowGroup {
            //Making ScrumsView the root view
            ScrumsView(scrums: $scrums)
        }
    }
}
