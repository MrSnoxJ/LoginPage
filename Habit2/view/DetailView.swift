//
//  DetailView.swift
//  Habit2
//
//  Created by Yerasyl Sharipov on 14.05.2023.
//

import SwiftUI

struct DetailView: View {
    var habit : Habit
    var body: some View {
        VStack {
            HStack {
                Text("\(habit.name)")
                Text("\(habit.displayDate())")
            }
            HStack{
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text("Date")
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let newhabit = Habit(name: "preview name", date: Date())
        DetailView(habit: newhabit)
    }
}
