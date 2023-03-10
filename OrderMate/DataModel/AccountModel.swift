//
//  LoginModel.swift
//  OrderMate
//
//  Created by 이수민 on 2023/03/10.
//

import Foundation




struct AccountModel {
    let urlString = "http://localhost:8080/join"
    
    func makeAccountPost(_ myUserName: String, _ myPassWord: String, _ myName: String, _ myNickName: String, _ isMale: Bool, _ mySchool: String, _ myMajor: String) -> Bool {
        var postSuccess = true
        
        var urlComponents = URLComponents(string: urlString)
        urlComponents?.path = "/join"
        let body  = [
            URLQueryItem(name: "username", value: myUserName),
            URLQueryItem(name: "password", value: myPassWord),
            URLQueryItem(name: "name", value: myName),
            URLQueryItem(name: "nickname", value: myNickName),
            URLQueryItem(name: "gender", value: isMale ? "MALE" : "FEMALE"),
            URLQueryItem(name: "school", value: mySchool),
            URLQueryItem(name: "major", value: myMajor)
        ]
        
        urlComponents?.percentEncodedQueryItems = body
        
        let url = urlComponents?.url!
        print("url : \(url)")
        
        var request: URLRequest = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            guard let e = error else {return}
            postSuccess = true
            
        }
        task.resume()
        print("success = \(postSuccess)")
        return postSuccess
    }
    func loginGet(_ userName: String, _ userPassWord: String) -> Bool {
        var success = false
        
        
        return success
        
    }
    
    func postUser(username: String, password: String, name: String, nickname: String, gender: String, school: String, major: String) -> Bool {
        let user = PostUser(username: username, password: password, name: name, nickName: nickname, gender: "MALE", school: school, major: major)
        guard let uploadData = try? JSONEncoder().encode(user)
        else { return false }
        
        let url = URL(string: urlString)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
            
            let successRange = 200..<300
            guard error == nil, let statusCode = (response as? HTTPURLResponse)?.statusCode, successRange.contains(statusCode) else {
                    print("Error occur: \(String(describing: error))")
                return
            }
            
            let postSuccess = 201
            if postSuccess == (response as? HTTPURLResponse)?.statusCode {
                print("User 정보 post 성공")
                print(response)
            }
        }
        task.resume()
        return true
    }
    
}

