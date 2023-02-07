//
//  MainTabView.swift
//  TodoList
//
//  Created by 신채은 on 2023/02/07.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject var viewModel = TodoViewModel()
    
    var body: some View {
        TabView {
            TodoView(todoItem: $viewModel.todoItem)
                .tabItem {
                    TabMenu.toDo.imageItem
                    TabMenu.toDo.textItem
                }
            Text("calendar")
                .tabItem {
                    TabMenu.calendar.imageItem
                    TabMenu.calendar.textItem
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
