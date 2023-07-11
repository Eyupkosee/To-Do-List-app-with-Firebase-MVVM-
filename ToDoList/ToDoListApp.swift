//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by eyüp köse on 13.06.2023.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
