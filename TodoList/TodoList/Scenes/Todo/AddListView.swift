//
//  AddListView.swift
//  TodoList
//
//  Created by 신채은 on 2023/02/07.
//

import SwiftUI

struct AddListView: View {
    @Binding var todoItem: [TodoItem]
    @ObservedObject var viewModel = TodoViewModel()
    
    @Environment(\.presentationMode) var presentation
    
    @State var task = ""
    @State var memo = ""
    @State var deadline = false
    @State var currentDate = Date()
    
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CategoryView(category: self.$viewModel.category)) {
                    Text("카테고리")
                }
                TextField("제목", text: self.$task)
                    .autocorrectionDisabled(true)
                TextField("메모", text: self.$memo)
                    .autocorrectionDisabled(true)
                Toggle("마감 시간", isOn: $deadline)
                if deadline {
                    DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
                        .datePickerStyle(WheelDatePickerStyle())
                }
            }
            .navigationBarTitle(Text("목록 추가"), displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                presentation.wrappedValue.dismiss()
            }){
                Text("취소")
            })
            .navigationBarItems(trailing: Button(action: {addList()}) {
                Text("저장")
            })
        }
        .accentColor(.purple)
    }
    
    private func addList() {
        self.todoItem.append(TodoItem(category: "test", task: self.task, memo: self.memo))
        presentation.wrappedValue.dismiss()
    }
}

//struct AddListView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddListView()
//    }
//}
