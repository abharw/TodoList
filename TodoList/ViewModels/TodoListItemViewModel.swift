//
//  TodoListItemViewModel.swift
//  TodoList
//
//  Created by Arav Bhardwaj on 7/12/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
 
class TodoListItemViewModel: ObservableObject {
    
    init() {}
    
    func toggleIsDone(item: TodoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
}
