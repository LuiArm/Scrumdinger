//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by luis armendariz on 11/16/23.
//

import SwiftUI

//class must be marked as @MainActor before it is safe to update the published scrums property from the asynchronous load() method.
@MainActor
class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appending(path: "scrums.data")
    }
    
    func load() async throws {
        //store task in let so that later you can access values returned or catch errors thrown from task
        let task = Task<[DailyScrum], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data)
            return dailyScrums
        }
        let scrums = try await task.value
        //assigning the returned task value to scrums line above and assigning it to the published scrums empty array 
        self.scrums = scrums
    }
    
    func save(scrums: [DailyScrum]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(scrums)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        // underscore indicates not interested in result
        _ = try await task.value
    }
}
