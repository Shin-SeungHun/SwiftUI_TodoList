//
//  ListRowView.swift
//  TodoList
//
//  Created by 신승훈 on 2024/03/25.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            
            Text(item.title)
            
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 4)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
        static var item1 = ItemModel(title: "안녕하세요 11", isCompleted: false)
        static var item2 = ItemModel(title: "안녕하세요 33", isCompleted: true)
    
        static var previews: some View {
            Group {
               ListRowView(item: item1)
               ListRowView(item: item2)
           }
            .previewLayout(.sizeThatFits)
        }
    
}
