//
//  TodoViewModel.swift
//  TodoList
//
//  Created by 신채은 on 2023/02/07.
//

import SwiftUI

class TodoViewModel: ObservableObject {
    
    @Published var todoItem: [TodoItem] = []
    
    @Published var category: [Category] = [
        Category(category: "학교"),
        Category(category: "집안일"),
        Category(category: "루틴")
    ]
}
