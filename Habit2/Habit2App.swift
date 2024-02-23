//
//  Habit2App.swift
//  Habit2
//
//  Created by Yerasyl Sharipov on 26.04.2023.
//

import SwiftUI
import Firebase
import FirebaseAuth
@main
struct Habit2App: App {
    
    let persistenceController = PersistenceController.shared
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        
        WindowGroup {
            
           ControlView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
