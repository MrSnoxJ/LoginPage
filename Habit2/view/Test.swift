//
//  Test.swift
//  Habit2
//
//  Created by Yerasyl Sharipov on 20.05.2023.
//

import SwiftUI

struct Test: View {
    @State private var isShowingPopup = false
    
    var body: some View {
        ZStack {
            Button(action: {
                isShowingPopup = true
            }) {
                Text("Show Pop-up")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.black)
                    .font(.headline)
                    .cornerRadius(10)
            }
            
            if isShowingPopup {
                VStack {
                    Text("This is a Pop-up View")
                        .font(.title)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                    
                    Button(action: {
                        isShowingPopup = false
                    }) {
                        Text("Close")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .font(.headline)
                            .cornerRadius(10)
                    }
                    .padding(.top, 20)
                }
                .padding()
                .background(Color.black.opacity(0.5))
                .transition(.scale) 
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
