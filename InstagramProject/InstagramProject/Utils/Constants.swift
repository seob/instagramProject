//
//  Constants.swift
//  InstagramProject
//
//  Created by seob on 2018. 7. 28..
//  Copyright © 2018년 seob. All rights reserved.
//

import Foundation

enum API {
    static let baseURL = "http://seob1.kakaoapps.co.kr/api/"
    
    enum Auth {
        static let signUp = API.baseURL + "members/signup/"
        static let signIn = API.baseURL + "members/auth-token/"
        //static let userDetail = API.baseURL + "members/profile/"
    }
    enum Post {
        static let list = API.baseURL + "posts/"
        static let create = API.baseURL + "posts/"
    }
}
