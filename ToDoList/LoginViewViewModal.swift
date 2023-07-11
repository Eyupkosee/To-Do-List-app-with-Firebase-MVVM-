//
//  LoginViewViewModal.swift
//  ToDoList
//
//  Created by eyüp köse on 15.06.2023.
//

import FirebaseAuth
import Foundation

class  LoginViewViewModal: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    
    init() {
        
    }
    
    func login(){
        guard validate() else{
            return
        }
            
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func validate() -> Bool{
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMessage = ("Please fill in all fields")
            return false
        }
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter valid email."
            return false
        }
        return true
    }
    
    
}
