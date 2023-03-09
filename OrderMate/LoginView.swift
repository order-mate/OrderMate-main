//
//  LoginView.swift
//  iosOrdermate
//
//  Created by cnu on 2023/03/02.
//

import SwiftUI

struct LoginView: View {
    @Binding var LoginState: Bool
    @State var myIdString: String = ""
    @State var myPasswordString: String = ""
    @State var isSecureMode: Bool = true
    
    var body: some View {
        VStack {
            Text("LoginView")
            TextField("ID space", text: $myIdString)
                .textFieldStyle(.roundedBorder)
            HStack {
                if isSecureMode {
                    SecureField("password", text: $myPasswordString)
                        .textFieldStyle(.roundedBorder)
                } else {
                    TextField("password", text: $myPasswordString)
                        .textFieldStyle(.roundedBorder)
                }
                Button {
                    isSecureMode.toggle()
                } label: {
                    Image(systemName: "eye")
                }
            }
            Button {
                LoginState = true
            } label: {
                Text("login button")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    @State static var LoginState = false
    
    static var previews: some View {
        LoginView(LoginState: $LoginState, myIdString: "IDIDIDID", myPasswordString: "PASSPASS", isSecureMode: false)
    }
}
