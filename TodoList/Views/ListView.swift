//
//  ListView.swift
//  TodoList
//
//  Created by 신승훈 on 2024/03/25.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var vm: ListViewModel
    
    var body: some View {
        
        ZStack {
            if vm.items.isEmpty {
               NoItemsView()
            } else {
                List {
                    ForEach(vm.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    vm.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: vm.deleteItem)
                    .onMove(perform: vm.moveItem)
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("메모")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    AddView()
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
    .environmentObject(ListViewModel())
}
