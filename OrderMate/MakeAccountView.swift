//
//  MakeAccountView.swift
//  OrderMate
//
//  Created by cnu on 2023/03/09.
//

import SwiftUI

struct MakeAccountView: View {
    @Binding var LoginState: Bool
    @State var myIdString: String = ""
    @State var myPasswordString: String = ""
    @State var isSecureMode: Bool = true
    var body: some View {
        VStack {
            Text("MakeAccountView")
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

struct MakeAccountView_Previews: PreviewProvider {
    @State static var LoginState = false
    static var previews: some View {
        MakeAccountView(LoginState: $LoginState, myIdString: "IDIDIDID", myPasswordString: "PASSPASS", isSecureMode: false)
    }
}
