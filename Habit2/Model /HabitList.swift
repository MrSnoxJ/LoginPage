//
//  HabitList.swift
//  Habit2
//
//  Created by Yerasyl Sharipov on 14.05.2023.
//

import Foundation
  
class HabitList : ObservableObject {
    
    @Published var habitList : [Habit] = []
    
    init () {
        let habit1 = Habit(name: "Habit1", date: Date())
        let habit2 = Habit(name: "Habit2", date: Date())
        let habit3 = Habit(name: "Habit3", date: Date())
        addHabit(newHabit: habit1)
        addHabit(newHabit: habit2)
        addHabit(newHabit: habit3)
    }
    public func addHabit(newHabit : Habit) {
        habitList.append(newHabit)
    }
    public func getHabitList() -> [Habit]{
        return habitList
    }
}
