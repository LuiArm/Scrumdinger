//
//  NewScrumSheetView.swift
//  Scrumdinger
//
//  Created by luis armendariz on 11/15/23.
//

import SwiftUI

struct NewScrumSheetView: View {
    @Binding var scrums: [DailyScrum]
    @State private var newScrum = DailyScrum.emptyScrum
    
    @Binding var isPresentingNewScrumView: Bool
    
    var body: some View {
        NavigationStack {
            //NewScrumSheet owns the source of truth for newScrum and passes a binding to DetailEditView
            DetailEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction){
                        Button("Dismiss"){
                            isPresentingNewScrumView = false
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction){
                        Button("Add"){
                            //scrums array is binding, updating the array in the view updates the source of truth contained in the app
                            scrums.append(newScrum)
                            isPresentingNewScrumView = false
                        }
                    }
                }
        }
    }
}

#Preview {
    NewScrumSheetView(scrums: .constant(DailyScrum.sampleData),isPresentingNewScrumView: .constant(true))
}
