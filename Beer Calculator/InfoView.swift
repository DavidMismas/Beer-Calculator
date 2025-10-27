//
//  InfoView.swift
//  Beer Calculator
//
//  Created by David Mišmaš on 28. 10. 25.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        
        ZStack {
            Color(Color.background)
                .ignoresSafeArea()
            
            VStack {
                Text("Calculation is based on a single 0.5l lager beer with average 210 Kcal. Calories are calculated based on average 75kg of weight per person. You have to understand, this is your direct beer calories only, no your daily food consuption, neither your base daily calories consuption are included in calculations.")
                    .font(.system(size: 18, weight: .semibold))
                    .multilineTextAlignment(.center)
                Text("It's for entertaining purpuses only. ")
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.top)
                   
            }
            .padding()
            
        }
    }
}

#Preview {
    InfoView()
}
