//
//  SplashViewController.swift
//  InstagramProject
//
//  Created by seob on 2018. 7. 28..
//  Copyright © 2018년 seob. All rights reserved.
//

import UIKit

final class SplashViewController: UIViewController {

   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        UserService.me() { response in
//            switch response.result {
//            case .success(let value):
//                print("내 프로필 정보 받아오기 성공!", value)
//                AppDelegate.instance?.presentMainSreen()
//
//            case .failure(let error):
//                print("내 프로필 정보 받아오기 실패 ㅠㅠ", error)
//                AppDelegate.instance?.presentLoginSreen()
//            }
//        }
        AppDelegate.instance?.presentLoginSreen()
    }
}
