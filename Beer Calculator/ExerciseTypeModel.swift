//
//  ExerciseTypeModel.swift
//  Beer Calculator
//
//  Created by David Mišmaš on 27. 10. 25.
//

import Foundation

enum ExerciseType: String, CaseIterable, Identifiable {
    
    case running, hiking, cycling, swimming
    
    var id: Self { self }
    

    
    func calculateCaloriesBurned(distance: Double) -> Double {
        switch self {
        case .running: return distance * 75 / 210
        case .hiking: return distance * 55 / 210
        case .cycling: return distance * 35 / 210
        case .swimming: return distance * 450 / 210
        }
    }
    
    func calculateBeers(numberOfBeers: Double) -> Double {
        switch self {
        case .running: return numberOfBeers * 210 / 75
        case .hiking: return numberOfBeers * 210 / 55
        case .cycling: return numberOfBeers * 210 / 35
        case .swimming: return numberOfBeers * 210 / 450
        }
    }
   
}


