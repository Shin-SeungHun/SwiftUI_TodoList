//
//  AddVoew.swift
//  TodoList
//
//  Created by 신승훈 on 2024/03/25.
//

import SwiftUI

struct AddView: View {
    @State var textFieldText: String = ""
    @State var showAlert: Bool = false
    
    @EnvironmentObject var vm: ListViewModel
    @Environment(\.dismiss) var dismiss
    
    
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("메모를 추가...", text: $textFieldText)
                    .font(.title2)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("저장")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue).cornerRadius(10)
                    
                }
            }
            .font(.title2)
            .padding()
        }
        
        .navigationTitle("메모 추가")
        .alert("메모가 짧아요", isPresented: $showAlert) {
            
        } message: {
            Text("메모를 조금 더 길게 써 볼까요")
        }
        
    }
    
    func saveButtonPressed() {
        if isAppropriate() {
            vm.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    func isAppropriate() -> Bool {
        if textFieldText.count < 2 {
            showAlert.toggle()
            return false
        }
        return true
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
}
