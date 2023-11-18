//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by luis armendariz on 10/31/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()
    
    var body: some Scene {
        //views added to WindowGroup scene builder are presented in a window that fills the devices entire screen
        WindowGroup {
            //Making ScrumsView the root view
            ScrumsView(scrums: $store.scrums){
            Task{
                do {
                    try await store.save(scrums: store.scrums)
                }catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
            .task {
                do {
                    try await store.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}
