//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by eyüp köse on 15.06.2023.
//

import Foundation

struct toDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
    
}
