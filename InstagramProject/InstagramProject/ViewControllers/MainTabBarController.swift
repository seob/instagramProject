//
//  MainTabBarController.swift
//  InstagramProject
//
//  Created by seob on 2018. 7. 28..
//  Copyright © 2018년 seob. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    fileprivate let textLabel = UILabel().then {
        $0.text = "test" 
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main"
        view.addSubview(textLabel)
        self.textLabel.snp.makeConstraints { make in
            make.top.equalTo(self.topLayoutGuide.snp.bottom).offset(15)
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalTo(30)
        }
//        self.usernameTextField.snp.makeConstraints { make in
//            make.top.equalTo(self.topLayoutGuide.snp.bottom).offset(15)
//            make.left.equalTo(30)
//            make.right.equalTo(-30)
//            make.height.equalTo(35)
//        }
        

        // Do any additional setup after loading the view.
    }
 

}
