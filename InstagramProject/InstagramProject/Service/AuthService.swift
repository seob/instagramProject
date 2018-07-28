//
//  AuthService.swift
//  InstagramProject
//
//  Created by seob on 2018. 7. 28..
//  Copyright © 2018년 seob. All rights reserved.
//

import Alamofire

struct AuthService {
    static func login(username: String,
                      password: String,
                      completion: @escaping (DataResponse<Void>) -> Void){
        
        let urlString = "http://seob1.kakaoapps.co.kr/api/user.php"
        let parameters: [String: Any] = [
            "username": username,
            "userpwd": password,
            ]
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            ]
        Alamofire
            .request(urlString, method: .post, parameters: parameters, headers: headers)
            .validate(statusCode: 200..<400)
            .responseJSON { response in
                let response: DataResponse<Void> = response.flatMap { _ in
                    return .success(Void())
                }
                completion(response)
        }
        
    }
    
    
    static func logout(){
        let storage = HTTPCookieStorage.shared
        for cookie in storage.cookies ?? [] {
            storage.deleteCookie(cookie)
            print("쿠키 삭제: \(cookie.name)")
        }
    }
}
