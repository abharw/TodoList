//
//  TodoListViewModel.swift
//  TodoList
//
//  Created by Arav Bhardwaj on 7/12/24.
//
import FirebaseFirestore
import Foundation

class TodoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private var userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func deleteItem(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
