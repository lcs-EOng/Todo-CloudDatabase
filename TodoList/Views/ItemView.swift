//
//  ItemView.swift
//  TodoList
//
//  Created by Russell Gordon on 2024-04-08.
//

import SwiftUI

struct ItemView: View {
    
    @Binding var currentItem: TodoItem
    
    //Receive a referance to the view model
    @Environment(TodoListViewModel.self) var viewModel
    
    var body: some View {
        Label(
            title: {
                TextField("", text: $currentItem.title, axis: .vertical)
            }, icon: {
                Image(systemName: currentItem.done == true ? "checkmark.circle" : "circle")
                    // Tap to mark as done
                    .onTapGesture {
                        currentItem.done.toggle()
                        viewModel.update(todo: currentItem)
                    }
                
            }
        )
    }
}

#Preview {
    List {
        ItemView(currentItem: .constant(firstItem))
        ItemView(currentItem: .constant(secondItem))
    }
}
