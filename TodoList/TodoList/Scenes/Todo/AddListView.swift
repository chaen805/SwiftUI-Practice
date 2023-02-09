//
//  AddListView.swift
//  TodoList
//
//  Created by 신채은 on 2023/02/07.
//

import SwiftUI

struct AddListView: View {
    @Binding var todoItem: [TodoItem]
    @Binding var category: [Category]
    @ObservedObject var viewModel = TodoViewModel()
    
    @Environment(\.presentationMode) var presentation
    
    @State var task = ""
    @State var memo = ""
    @State var selectedCategory = ""
    @State var deadlineOn = false
    @State var currentDate = Date()
    
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CategoryView(category: self.$viewModel.category, selectedCategory: self.$selectedCategory)) {
                    HStack {
                        Text("카테고리")
                            .fontWeight(.semibold)
                        Spacer()
                        Text(selectedCategory)
                    }
                }
                HStack {
                    Text("할 일")
                        .fontWeight(.semibold)
                    Spacer()
                    TextField("제목", text: self.$task)
                        .autocorrectionDisabled(true)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("메모")
                        .fontWeight(.semibold)
                    Spacer()
                    TextField("추가 내용", text: self.$memo)
                        .autocorrectionDisabled(true)
                        .multilineTextAlignment(.trailing)
                }
                Toggle("마감 시간", isOn: $deadlineOn)
                    .fontWeight(.semibold)
                if deadlineOn {
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
        let dateFormatterDay = DateFormatter()
        dateFormatterDay.dateFormat = "yyyy-MM-dd"
        let today = dateFormatterDay.string(from: currentDate)
        
        let dateFormatterTime = DateFormatter()
        dateFormatterTime.dateFormat = "hh:mm"
        let deadline = dateFormatterTime.string(from: currentDate)
        
        if deadlineOn {
            self.todoItem.append(TodoItem(category: self.selectedCategory, task: self.task, memo: self.memo, today: today, deadline: deadline))
        } else {
            self.todoItem.append(TodoItem(category: self.selectedCategory, task: self.task, memo: self.memo, today: today))
        }
        presentation.wrappedValue.dismiss()
    }
}

//struct AddListView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddListView()
//    }
//}
