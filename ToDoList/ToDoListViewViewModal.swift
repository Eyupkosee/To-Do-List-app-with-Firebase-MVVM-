//
//  ToDoListViewViewModal.swift
//  ToDoList
//
//  Created by eyüp köse on 15.06.2023.
//

import Foundation
import FirebaseFirestore


class ToDoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete { error in
                if let error = error {
                    print("Silme işlemi başarısız oldu: \(error.localizedDescription)")
                } else {
                    print("Silme işlemi başarılı oldu.")
                }
            }
    }

    
}
