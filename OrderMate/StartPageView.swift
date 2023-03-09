//
//  StartPageView.swift
//  iosOrdermate
//
//  Created by cnu on 2023/03/02.
//

import SwiftUI

struct StartPageView: View {
    @Binding var LoginState: Bool
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                Text("Order Mate")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                Spacer()
                NavigationLink {
                    LoginView(LoginState: $LoginState)
                } label: {
                    Text("로그인")
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .font(.system(size: 20))
                        .frame(width: 320, height: 75)
                        .background(Color.orange)
                        .cornerRadius(20)
                }
                NavigationLink {
                    MakeAccountView(LoginState: $LoginState)
                } label: {
                    Text("회원가입")
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .font(.system(size: 20))
                        .frame(width: 320, height: 75)
                        .background(Color.yellow)
                        .cornerRadius(20)
                }
                
                Spacer()
                    .frame(height: 10)
            }

        }
 
    }
}

struct StartPageView_Previews: PreviewProvider {
    @State static var LoginState = false
    static var previews: some View {
        StartPageView(LoginState: $LoginState)
    }
}
