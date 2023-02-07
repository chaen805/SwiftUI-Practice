//
//  TodoView.swift
//  TodoList
//
//  Created by 신채은 on 2023/02/07.
//

import SwiftUI

struct TodoView: View {
    @Binding var todoItem: [TodoItem]
//    @ObservedObject var viewModel = TodoViewModel()
    @State private var addListModal = false
    
    var body: some View {
        NavigationView {
            List {
                // To Do - 실제 입력 받아서 만들 수 있도록 수정해야함
                ForEach(todoItem) { item in
                    Text(item.task)
                }
                .onDelete(perform: delete)
                .onMove(perform: onMove)
            }
            .listStyle(PlainListStyle())
            
            .navigationBarTitle(Text("오늘의 할 일"))
            .navigationBarItems(leading: EditButton())
            .navigationBarItems(trailing: Button(action: { self.addListModal = true }) {
                Image(systemName: "plus")
            }
                .sheet(isPresented: self.$addListModal) {
                    AddListView(todoItem: self.$todoItem)
                })
        }
    }
    
    private func delete(at offsets: IndexSet) {
        todoItem.remove(atOffsets: offsets)
    }
    private func onMove(source: IndexSet, destination: Int) {
        todoItem.move(fromOffsets: source, toOffset: destination)
    }
}

//struct TodoView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodoView(todoItem: $viewModel.todoItem)
//    }
//}
