//
//  AddHabitVIew .swift
//  Habit2
//
//  Created by Yerasyl Sharipov on 17.05.2023.
//

import SwiftUI

struct AddHabitVIew_: View {
    @State var name : String
    @State var date : String
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var theHabitList = HabitList()
    var body: some View {
        ZStack(alignment: .center,content: {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 350,height: 350)
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 10)
            
                                    
             

            
            
            
            
        }).overlay(content: {
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(Color("main"))
                                .font(.title)
                                .padding()
                    })
                    }
                    Spacer()
                }

                VStack (alignment : .leading){
                    Text("Name")
                        .padding(.horizontal)
                    HStack {
                        TextField("Name", text: $name)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 16)
                                .fill(Color.gray.opacity(0.3))
                                        
                            )
                    }.padding()
                    Text("Date")
                        .padding(.horizontal)
                    HStack {
                        TextField("Date", text: $date)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 16)
                                .fill(Color.gray.opacity(0.3))
                                        
                            )
                    }.padding()
                    HStack {
                        Spacer()
                        Button(action: {
                            // MARK: -
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(width: 150,height: 50)
                                    .foregroundColor(Color("main"))
                                Text("Save")
                                    .padding()
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            
                        })
                        Spacer()
                    }
                    
                }
            }
        })
        
    }
    
    struct AddHabitVIew__Previews: PreviewProvider {
        static var previews: some View {
            AddHabitVIew_(name: "name", date: "Date")
        }
    }
}
