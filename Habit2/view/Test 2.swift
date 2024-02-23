//
//  Test.swift
//  Habit2
//
//  Created by Yerasyl Sharipov on 14.05.2023.
//

import SwiftUI

struct Test: View {
    @ObservedObject var theHabitList = HabitList()
    var body: some View {
        NavigationView {
            VStack{
                List{
                    ForEach(theHabitList.getHabitList(),id: \.self){ habitrow in
                        NavigationLink(destination: DetailView(habit: habitrow), label: {
                            Text("\(habitrow.name)")
                        }).padding()
                    }
                }
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
