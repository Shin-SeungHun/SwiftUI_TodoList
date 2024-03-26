//
//  TodoListApp.swift
//  TodoList
//
//  Created by 신승훈 on 2024/03/25.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var vm = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(vm)
        }
    }
}
