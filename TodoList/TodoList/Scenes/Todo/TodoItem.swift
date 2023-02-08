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
    let today: String
    var deadline: String = "23:59"
    
    let id = UUID()
}
