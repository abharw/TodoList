//
//  NewItemViewModel.swift
//  TodoList
//
//  Created by Arav Bhardwaj on 7/12/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation


class NewItemViewViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        // Get current user id
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        // Create model
        let newId = UUID().uuidString
        let newItem = TodoListItem(id: newId, 
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970 ,
                                   createdDate: Date().timeIntervalSince1970, 
                                   isDone: false)
        // Save model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
                return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
