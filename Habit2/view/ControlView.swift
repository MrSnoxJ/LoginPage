//
//  ControlView.swift
//  Habit2
//
//  Created by Yerasyl Sharipov on 08.05.2023.
//

import SwiftUI
struct ListItem: Identifiable {
    var id = UUID()
    var name: String
}
struct ControlView: View {
    @ObservedObject var theHabitList = HabitList()
    @EnvironmentObject var controlButtons : ControlButton
    var body: some View {
        NavigationView {
            ZStack(alignment:.top){
                VStack{
                    Text("Habit")
                        .italic()
                        .foregroundColor(Color("main"))
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: 100,height: 100)
                    Text("All your Habits are here! You want to add more?")
                        .font(.system(size: 36))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    ZStack{
                        Form{
                            List{
                                ForEach(theHabitList.getHabitList(),id: \.self){ habitrow in
                                    NavigationLink(destination: DetailView(habit: habitrow), label: {
                                        Text("\(habitrow.name)")
                                    }).padding()
                                }
                            }.listSectionSeparatorTint(.blue)
                                
                            
                        }.scrollContentBackground(.hidden)
                            .background(Color("main"),
                              in: RoundedRectangle(cornerRadius: 16))
                    }.padding()
                    Button(action: {
                        self.controlButtons.addHabit.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 30,height: 30)
                            .foregroundColor(Color("main"))
                    })
                    .padding()
                    if controlButtons.addHabit {
                        AddHabitVIew_(name: "name", date: "date")
                    }
                }
            }
        }
    }
}

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ControlView()
    }
}
