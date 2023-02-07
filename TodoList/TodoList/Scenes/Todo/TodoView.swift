//
//  TodoView.swift
//  TodoList
//
//  Created by 신채은 on 2023/02/07.
//

import SwiftUI

struct TodoView: View {
//    @ObservedObject var viewModel = TodoViewModel()
    @Binding var todoItem: [TodoItem]
    
    @State private var addListModal = false
    
    var body: some View {
        NavigationView {
            List {
                // To Do - 실제 입력 받아서 만들 수 있도록 수정해야함
                ForEach(todoItem) { item in
                    Text(item.task)
                }
            }.listStyle(PlainListStyle())
            .navigationBarTitle(Text("오늘의 할 일"))
            .navigationBarItems(leading: Button(action: {}) {
                Text("편집")
            })
            .navigationBarItems(trailing: Button(action: {
                self.addListModal = true}){
                Image(systemName: "plus")
            }
                .sheet(isPresented: self.$addListModal) {
                    AddListModalView()
                            }
            )
        }
    }
}

struct AddListModalView: View {
    @Environment(\.presentationMode) var presentation
        
        var body: some View {
            NavigationView {
                AddListView()
                    .navigationBarTitle(Text("목록 추가"), displayMode: .inline)
                    .navigationBarItems(leading: Button(action: {
                        presentation.wrappedValue.dismiss()
                    }){
                        Text("취소")
                    })
                    .navigationBarItems(trailing: Button(action: {}) {
                        Text("저장")
                    })
            }.accentColor(.purple)
        }
}

//struct TodoView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodoView(todoItem: $viewModel.todoItem)
//    }
//}
