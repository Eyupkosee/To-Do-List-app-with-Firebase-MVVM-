//
//  NewItemViewViewModal.swift
//  ToDoList
//
//  Created by eyüp köse on 15.06.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject{
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    
    func save(){
        guard canSave else{
            return
        }
        // get user id
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        
        // create model
        let newId = UUID().uuidString
        let newItem = toDoListItem(id: newId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        // save model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
        
        
    }
    
    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86000) else{
            return false
        }
        
        return true
    }
    
}
