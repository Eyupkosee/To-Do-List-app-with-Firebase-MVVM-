//
//  MainViewViewModal.swift
//  ToDoList
//
//  Created by eyüp köse on 15.06.2023.
//

import Foundation
import FirebaseAuth

class MainViewViewModal: ObservableObject {
    @Published var currentUserId : String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addIDTokenDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool{
        return Auth.auth().currentUser != nil
    }
}
