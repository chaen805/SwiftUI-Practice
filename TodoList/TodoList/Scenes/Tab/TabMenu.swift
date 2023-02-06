//
//  TabMenu.swift
//  TodoList
//
//  Created by 신채은 on 2023/02/07.
//

import SwiftUI

enum TabMenu {
    case toDo
    case calendar
    
    var textItem: Text {
        switch self {
        case .toDo: return Text("To-do")
        case .calendar: return Text("Calendar")
        }
    }

    var imageItem: Image {
        switch self {
        case .toDo: return Image(systemName: "list.dash")
        case .calendar: return Image(systemName: "calendar")
        }
    }
}
