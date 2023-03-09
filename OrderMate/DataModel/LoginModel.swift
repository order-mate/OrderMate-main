//
//  LoginModel.swift
//  OrderMate
//
//  Created by 이수민 on 2023/03/10.
//

import Foundation
import Alamofire
struct LoginModel {
    
    func loginGet(_ userName: String, _ userPassWord: String) -> Bool {
        var success = false
        var url = URL(string: "http://localhost:8080/login")!
        let body : Parameters = [
            "username" : "12",
            "password" : "1234"
        ]
        let header : HTTPHeaders = ["Content-Type" : "application/json"]
        let loginDataRequest = AF.request(url,
                                          method: .get,
                                          parameters: body,
                                          encoding: JSONEncoding.default,
                                          headers: header)
        
        loginDataRequest.responseData { response in
            switch response.result {
                case .success:
                    guard let statusCode = response.response?.statusCode else {return}
                    guard let value = response.value else {return}
                    success = true
                    return
                case .failure:
                    print("실패")
                    print(response.error)
                    success = false
                    return
            }
        }
        return success
        
    }
    
}
//        loginRequestURL.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        loginRequestURL.setValue("1936", forHTTPHeaderField: "Content-Length")
//        loginRequestURL.setValue("Fri, 10 Mar 2023 12:19:36 GMT", forHTTPHeaderField: "Date")
//        loginRequestURL.setValue("PostmanRuntime/7.31.1", forHTTPHeaderField: "User-Agent")
//        loginRequestURL.setValue("en", forHTTPHeaderField: "Content-Language")
//        loginRequestURL.setValue("*/*", forHTTPHeaderField: "Accept")
//        loginRequestURL.setValue("gzip, deflate, br", forHTTPHeaderField: "Accept-Encoding")
//        loginRequestURL.setValue("keep-alive", forHTTPHeaderField: "Connection")
//        loginRequestURL.setValue("Identity", forHTTPHeaderField: "Transfer-Encoding")
//
//        loginRequestURL.setValue("JSESSIONID=D1585EF1BDACEF0F662719BD83EDFC8D", forHTTPHeaderField: "Cookie")
//        print(loginRequestURL.allHTTPHeaderFields)
//        print("")
//        print("====================================")
//        print("[requestGet : http get 요청 실시]")
//        print("url : ", loginRequestURL)
//        print("====================================")
//        print("")
//        let task = URLSession.shared.dataTask(with: loginRequestURL) { (data, response, error) in
//            guard error == nil else { print("error"); return }
//
//            let successsRange = 200..<300
//            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, successsRange.contains(statusCode)
//            else {
//                print("")
//                print("====================================")
//                print("[requestGet : http get 요청 에러]")
//                print("error : ", (response as? HTTPURLResponse)?.statusCode ?? 0)
//                print("msg : ", (response as? HTTPURLResponse)?.description ?? "")
//                print("====================================")
//                print("")
//                return
//            }
//
//            let resultCode = (response as? HTTPURLResponse)?.statusCode ?? 0
//
//            if resultCode == 200 {
//                print("성공")
//                success = true
//                return
//            }
//            else{
//                success = false
//                print("실패")
//                print(resultCode)
//                return
//            }
//        }
//        task.resume()
//        return success
//    }
    
//}
