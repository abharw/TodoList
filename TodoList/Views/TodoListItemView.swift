//
//  TodoListItem.swift
//  TodoList
//
//  Created by Arav Bhardwaj on 7/12/24.
//

import SwiftUI

struct TodoListItemView: View {
    @StateObject var viewModel = TodoListItemViewModel()
    let item: TodoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.purple)
            }
        }
    }
}

#Preview {
    TodoListItemView(item: TodoListItem(
        id: "123",
        title: "Todo",
        dueDate: Date().timeIntervalSince1970,
        createdDate: Date().timeIntervalSince1970,
        isDone: true))
}
