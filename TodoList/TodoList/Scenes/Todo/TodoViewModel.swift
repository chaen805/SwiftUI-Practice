//
//  TodoViewModel.swift
//  TodoList
//
//  Created by 신채은 on 2023/02/07.
//

import SwiftUI

class TodoViewModel: ObservableObject {
    
    @Published var todoItem: [TodoItem] = [
    TodoItem(task: "고양이 화장실 치우기", category: "집안일"),
    TodoItem(task: "비타민 섭취", category: "루틴"),
    TodoItem(task: "공업수학 과제", category: "학교")
    ]
    
    @Published var category: [Category] = [
        Category(category: "학교"),
        Category(category: "집안일"),
        Category(category: "루틴")
    ]
}
