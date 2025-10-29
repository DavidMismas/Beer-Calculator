//
//  CanIDriveView.swift
//  Beer Calculator
//
//  Created by David Mišmaš on 29. 10. 25.
//

import SwiftUI

struct CanIDriveView: View {
    
    @State private var showInfoView = false
    @State private var numberOfBeers: Double = 0.0
    
    private var numberFormatter: NumberFormatter {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 1
        nf.minimumFractionDigits = 0
        return nf
    }
    
    private var displayNumberBeers: Binding<String> {
        Binding<String>(
            get: {
                numberFormatter.string(from: NSNumber(value: numberOfBeers)) ?? ""
            },
            set: { newValue in
                if let number = numberFormatter.number(from: newValue) {
                    numberOfBeers = number.doubleValue
                } else if newValue.isEmpty {
                    numberOfBeers = 0
                }
            }
        )
    }
    
    // Use the same formula as ExerciseType.calculateHours(numberOfBeers:)
    private var showHours: String {
        let hours = numberOfBeers * 2.6
        return numberFormatter.string(from: NSNumber(value: hours)) ?? "0"
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color(Color.background)
                    .ignoresSafeArea()
                
                VStack {
                    
                    HStack {
                        Spacer()
                        Button(action:  {
                            showInfoView = true
                        }, label: {
                            Image(systemName: "mug")
                                .foregroundStyle(Color(.orangeSecondary))
                        })
                        
                        .padding(.trailing, 30)
                    }
                    
                    Spacer()
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("You had some beers?")
                        .font(.largeTitle)
                        .padding(.top, 20)
                    Text("How many beers?")
                        .font(.system(size: 15, weight: .semibold))
                        .padding(.top, 20)
                    TextField("Number of beers", text: displayNumberBeers)
                        .textFieldStyle(OvalTextFieldStyle())
                        .padding(.top, 20)
                    Text("You can't drive for:")
                        .font(.system(size: 15, weight: .semibold))
                        .padding(.top, 20)
                    
                    HStack {
                        Spacer()
                        Text(showHours + " " + "hours")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 60, weight: .bold))
                            .padding()
                            .frame(width: 250, height: 250)
                            .background(Circle().fill(Color.orangeSecondary))
                            .foregroundColor(.white)
                            .lineLimit(2)
                            .padding(.top, 40)
                        
                        
                        Spacer()
                        
                    }
                    
                    
                    Spacer()
                }
                .padding()
            }
            .navigationDestination(isPresented: $showInfoView) {
                InfoView()
            }
        }
    }
}

#Preview {
    CanIDriveView()
}
