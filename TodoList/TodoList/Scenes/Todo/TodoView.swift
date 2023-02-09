//
//  TodoView.swift
//  TodoList
//
//  Created by 신채은 on 2023/02/07.
//

import SwiftUI

struct TodoView: View {
    @Binding var todoItem: [TodoItem]
    @ObservedObject var viewModel = TodoViewModel()
    @State private var addListModal = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todoItem) { item in
                    NavigationLink(destination: TodoDetailView(todoItem: item)) {
                        Text(item.task)
                    }
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
            }
            .listStyle(PlainListStyle())
            
            .navigationBarTitle(Text("오늘의 할 일"))
            .navigationBarItems(leading: EditButton())
            .navigationBarItems(trailing: Button(action: { self.addListModal = true })
                                { Image(systemName: "plus") }
                .sheet(isPresented: self.$addListModal) {
                    AddListView(todoItem: self.$todoItem, category: self.$viewModel.category)
                })
        }
    }
    
    private func delete(at offsets: IndexSet) {
        todoItem.remove(atOffsets: offsets)
    }
    private func move(source: IndexSet, destination: Int) {
        todoItem.move(fromOffsets: source, toOffset: destination)
    }
}

struct TodoDetailView: View {
    let todoItem: TodoItem
    
    // To do : test를 위해 모든 변수를 보이도록 해놓음 추후 수정 필요
    var body: some View {
        List {
            Text("Category: \(todoItem.category)")
            Text("Task: \(todoItem.task)")
            Text("Memo: \(todoItem.memo)")
            Text("Date: \(todoItem.today)")
            Text("Deadline: \(todoItem.deadline)")
        }
    }
}

//struct TodoView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodoView(todoItem: $viewModel.todoItem)
//    }
//}
