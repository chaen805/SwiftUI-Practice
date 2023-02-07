//
//  AddListView.swift
//  TodoList
//
//  Created by 신채은 on 2023/02/07.
//

import SwiftUI

struct AddListView: View {
    @ObservedObject var viewModel = TodoViewModel()
    
    @State var task = ""
    @State var memo = ""
    @State private var deadline = false
    @State private var currentDate = Date()
    
    var body: some View {
        List {
            NavigationLink(destination: CategoryView(category: $viewModel.category)) {
                Text("카테고리")
            }
            TextField("제목", text: self.$task)
            TextField("메모", text: self.$memo)
            Toggle("마감 시간", isOn: $deadline)
            if deadline {
                DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
            }
        }
        
    }
}

struct AddListView_Previews: PreviewProvider {
    static var previews: some View {
        AddListView()
    }
}
