//
//  LoginView.swift
//  iosOrdermate
//
//  Created by cnu on 2023/03/02.
//

import SwiftUI

struct LoginView: View {
    @Binding var LoginState: Bool
    var body: some View {
        Text("LoginView")
        Button {
            LoginState = true
        } label: {
            Text("login button")
        }

    }
}

struct LoginView_Previews: PreviewProvider {
    @State static var LoginState = false
    static var previews: some View {
        LoginView(LoginState: $LoginState)
    }
}
