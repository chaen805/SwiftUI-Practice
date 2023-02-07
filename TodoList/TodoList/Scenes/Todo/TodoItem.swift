//
//  TodoItem.swift
//  TodoList
//
//  Created by 신채은 on 2023/02/07.
//

import SwiftUI

struct TodoItem: Identifiable {
    var task: String
    var category: String
    
    let id = UUID()
}
