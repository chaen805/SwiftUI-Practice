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
    
    @State private var newCategory = ""
    
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
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
            }
            .navigationBarTitle(Text("카테고리"), displayMode: .inline)
        }
    }
}

//struct AddCategoryView: View {
//    @Binding var category: String
//
//    var body: some View {
//        VStack {
//            Text("카테고리 이름을 입력하세요")
//            TextField("카테고리 이름", text: $category)
//        }
//    }



//struct CategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryView(todoItem: $viewModel.todoItem)
//    }
//}
