//
//  CategoryView.swift
//  TodoList
//
//  Created by 신채은 on 2023/02/07.
//

import SwiftUI

struct CategoryView: View {
    @Binding var category: [Category]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(category) { tag in
                    Text(tag.category)
                }
            }
            .navigationBarTitle(Text("카테고리"), displayMode: .inline)
        }
    }
}

//struct CategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryView(todoItem: $viewModel.todoItem)
//    }
//}
