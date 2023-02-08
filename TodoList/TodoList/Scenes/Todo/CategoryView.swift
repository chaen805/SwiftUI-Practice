//
//  CategoryView.swift
//  TodoList
//
//  Created by 신채은 on 2023/02/07.
//

import SwiftUI

struct CategoryView: View {
    @Binding var category: [Category]
    @Binding var selectedCategory: String
    
    var body: some View {
        NavigationView {
            List {
                Picker("", selection: $selectedCategory) {
                    ForEach(category) { tag in
                        Text(tag.category).tag(tag.category)
                    }
                }
                .pickerStyle(.inline)
            }
            .navigationBarTitle(Text("카테고리"), displayMode: .inline)
            // 카테고리 추가 창 필요 네비개이션 바 아이템 - trailing으로 생성, 새로운 뷰나 모달 뷰 아닌 알림 창으로 하면 될듯..
        }
    }
}

//struct CategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryView(todoItem: $viewModel.todoItem)
//    }
//}
