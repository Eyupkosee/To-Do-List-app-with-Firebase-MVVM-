//
//  ProfileViewViewModal.swift
//  ToDoList
//
//  Created by eyüp köse on 15.06.2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewViewModel: ObservableObject{
    init() {}
    
    
    func toggleIsDone(item: toDoListItem) {
        var ıtemCopy = item
        ıtemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore().collection("users")
            .document(uid)
            .collection("todos")
            .document(ıtemCopy.id)
            .setData(ıtemCopy.asDictionary())
        
    }
}
