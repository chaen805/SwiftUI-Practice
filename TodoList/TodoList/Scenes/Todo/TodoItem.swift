//
//  TodoItem.swift
//  TodoList
//
//  Created by 신채은 on 2023/02/07.
//

import SwiftUI

struct TodoItem: Identifiable {
    var category: String
    var task: String
    var memo: String
    var deadline: String = "2359"
    
//    init(category: String, task: String, memo: String, deadline: String) {
//        self.category   = category
//        self.task = task
//        self.memo  = memo
//        self.deadline = "2359"
//    }
    
    let id = UUID()
}
