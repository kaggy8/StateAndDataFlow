//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Stanislav Demyanov on 14.02.2023.
//

import SwiftUI

struct RegisterView: View {
    @AppStorage("username") private var userName: String = ""
    @AppStorage("isRegistered") private var isRegistered: Bool = false
    @EnvironmentObject private var user: UserManager
    
    var body: some View {
        VStack {
            HStack() {
                TextField("Введите ваше имя", text: $userName)
                    .multilineTextAlignment(.center)
                Text(changeColor("\(userName.count)"))
                    .font(.title)
                    .padding(.leading, -100)
                    .foregroundColor(.red)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(userName.count < 3)
        }
    }
    
    private func registerUser() {
        if !userName.isEmpty && userName.count >= 3 {
            user.name = userName
            user.isRegistered.toggle()
            isRegistered = true
        }
    }
    
    private func changeColor(_ string: String) -> AttributedString {
        guard var attributedString = try? AttributedString(markdown: string) else {
            return AttributedString(string)
        }
        
        if userName.count >= 3 {
            attributedString.foregroundColor = .green
            return attributedString
        } else {
            attributedString.foregroundColor = .red
            return attributedString
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
