//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by eyüp köse on 15.06.2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [toDoListItem]
    
    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                        }
                        .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
                .toolbar{
                    Button {
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "plus")
                    }

                }.sheet(isPresented: $viewModel.showingNewItemView) {
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                }
        }

    }
}

struct ToDoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "MQVOsmmTshfmVgEt1aUvUOhMd5f1")
    }
}
