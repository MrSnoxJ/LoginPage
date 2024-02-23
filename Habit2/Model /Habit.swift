//
//  Habit.swift
//  Habit2
//
//  Created by Yerasyl Sharipov on 14.05.2023.
//

import Foundation
struct Habit : Hashable {
    let name : String
    let date : Date
    
    
    func displayDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM y"
        return dateFormatter.string(from: date)
    }
}
