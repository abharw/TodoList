//
//  TodoListApp.swift
//  TodoList
//
//  Created by Arav Bhardwaj on 7/12/24.
//
import FirebaseCore
import SwiftUI

@main
struct TodoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
