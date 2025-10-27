//
//  ToBeersView.swift
//  Beer Calculator
//
//  Created by David Mišmaš on 27. 10. 25.
//

import SwiftUI

struct ToBeersView: View {
    
    
    @State private var distance: Double = 0.0
    @State private var selectedExercise: ExerciseType = .running
    
    @State private var showInfoView = false
    
    private var numberFormatter: NumberFormatter {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 2
        nf.minimumFractionDigits = 0
        return nf
    }

    
    private var displayDistance: Binding<String> {
        Binding<String>(
            get: {
                numberFormatter.string(from: NSNumber(value: distance)) ?? ""
            },
            set: { newValue in

                if let number = numberFormatter.number(from: newValue) {
                    distance = number.doubleValue
                } else if newValue.isEmpty {
                    distance = 0
                }
            }
        )
    }
    

    private var beersCount: Double {
        selectedExercise.calculateCaloriesBurned(distance: distance)
    }
    
    private var beersView: String {
        numberFormatter.string(from: NSNumber(value: beersCount)) ?? "0"
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
                        })
                        
                        .padding(.trailing, 30)
                    }
                    
                    Spacer()
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("You had some excersice?")
                        .font(.largeTitle)
                        .padding(.top, 20)
                    
                    Text("Enter distance")
                        .font(.system(size: 15, weight: .semibold))
                        .padding(.top, 20)
                    
                    TextField("distance in km", text: displayDistance)
                        .textFieldStyle(OvalTextFieldStyle())
                        .padding(.top, 20)
                    
                    Text("Pick exercise")
                        .font(.system(size: 15, weight: .semibold))
                        .padding(.top, 20)
                    
                    Picker("Exercise", selection: $selectedExercise) {
                        ForEach(ExerciseType.allCases, id: \.self) { type in
                            Text(type.rawValue.capitalized)
                            
                        }
                    }
                    .pickerStyle(.segmented)
                    .controlSize(.large)
                    .padding(.top, 20)
                    
                    
                    
                    HStack {
                        Spacer()
                        VStack(alignment: .center) {
                            Text("You can drink")
                                .font(.system(size: 24, weight: .semibold))
                            Text(beersView)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 60, weight: .bold))
                                .frame(width: 150, height: 150)
                                .background(Circle().fill(Color.orangeSecondary))
                                .foregroundColor(.white)
                                .lineLimit(2)
                                .padding(.top, 20)
                            Text("BEERS")
                                .font(.system(size: 24, weight: .semibold))
                            
                        }
                        .padding(.top, 50)
                        Spacer()
                    }
                    
                    
                    Spacer()
                }
                .padding()
            }
            
            .navigationDestination(isPresented: $showInfoView) {
                InfoView() }
        }
        }
    }


#Preview {
    ToBeersView()
}
