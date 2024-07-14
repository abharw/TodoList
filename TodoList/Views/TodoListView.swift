//
//  TodoListItem.swift
//  TodoList
//
//  Created by Arav Bhardwaj on 7/12/24.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel = TodoListViewViewModel()
    private let userId: String
    
    init(userId:String) {
        self.userId = userId
    }
    
    
    
    var body: some View {
        NavigationView {
            VStack{
                
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
    TodoListView(userId: "")
}
