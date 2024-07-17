//
//  TodoListItem.swift
//  TodoList
//
//  Created by Arav Bhardwaj on 7/12/24.
//
import FirebaseFirestoreSwift
import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel: TodoListViewViewModel
    @FirestoreQuery var items: [TodoListItem]
    
    init(userId:String) {
        self._viewModel = StateObject(wrappedValue: TodoListViewViewModel(userId: userId))
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(items) {
                    item in TodoListItemView(item: item)
                        .swipeActions{
                            Button {
                                // Delete
                                viewModel.deleteItem(id: item.id)
                            } label: {
                                Text("Delete")
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
                .padding()
            }
            .navigationTitle("Todo List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    TodoListView(userId: "eAxRlraB7cW3LLbdjHvbyU7No8P2")
}
