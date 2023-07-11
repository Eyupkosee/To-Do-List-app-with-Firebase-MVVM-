//
//  User.swift
//  ToDoList
//
//  Created by eyüp köse on 15.06.2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
