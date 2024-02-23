//
//  ControlButton.swift
//  Habit2
//
//  Created by Yerasyl Sharipov on 20.05.2023.
//

import Foundation
class ControlButton : ObservableObject{
    @Published var close : Bool = false
    @Published var addHabit : Bool = false
}
