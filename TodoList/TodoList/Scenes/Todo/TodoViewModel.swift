//
//  TodoViewModel.swift
//  TodoList
//
//  Created by 신채은 on 2023/02/07.
//

import SwiftUI

class TodoViewModel: ObservableObject {
    // 할 일 저장
    @Published var todoItem: [TodoItem] = []
    
    // 카테고리 목록
    @Published var category: [Category] = [
        Category(category: "루틴"),
        Category(category: "업무"),
        Category(category: "가사")
    ]
}
