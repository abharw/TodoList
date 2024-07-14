//
//  User.swift
//  TodoList
//
//  Created by Arav Bhardwaj on 7/12/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
