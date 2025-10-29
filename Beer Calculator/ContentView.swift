//
//  ContentView.swift
//  Beer Calculator
//
//  Created by David Mišmaš on 27. 10. 25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            TabView {
                Tab("To beers", systemImage: "mug") {
                    ToBeersView()
                }
                
                
                Tab("To exercise", systemImage: "figure.run") {
                    FromBeersView()
                }
                
                Tab("Can i drive?", systemImage: "car") {
                    CanIDriveView()
                }
                
            }
        }
        

    }
        
        
        
    }


#Preview {
    ContentView()
}
