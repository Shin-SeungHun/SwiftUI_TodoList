//
//  ListView.swift
//  TodoList
//
//  Created by 신승훈 on 2024/03/25.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "hello", "hi", "hoho"
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                Text(item)
            }
        }
        .listStyle(.plain)
        .navigationTitle("메모")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    Text("Add view")
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
}

#Preview {
    NavigationView {
        ListView()
    }
}
