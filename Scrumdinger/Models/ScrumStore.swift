//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by luis armendariz on 11/16/23.
//

import SwiftUI

class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appending(path: "scrums.data")
    }
}
