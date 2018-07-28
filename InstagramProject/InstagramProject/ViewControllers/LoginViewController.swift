//
//  LoginViewController.swift
//  InstagramProject
//
//  Created by seob on 2018. 7. 28..
//  Copyright © 2018년 seob. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    fileprivate let usernameTextField = UITextField().then {
        $0.borderStyle = .roundedRect
        $0.placeholder = "Username"
        $0.autocorrectionType = .no
        $0.autocapitalizationType = .none
        $0.font = UIFont.systemFont(ofSize: 14)
    }
    
    fileprivate let userpwdTextField = UITextField().then {
        $0.borderStyle = .roundedRect
        $0.placeholder = "Userpassword"
        $0.isSecureTextEntry = true
        $0.font = UIFont.systemFont(ofSize: 14)
    }
    fileprivate let loginButton = UIButton().then {
        $0.backgroundColor = $0.tintColor
        $0.layer.cornerRadius = 5
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        $0.setTitle("Login", for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        
        self.usernameTextField.addTarget(self, action: #selector(textFieldDidChangeText(_:)), for: .editingChanged)
        self.userpwdTextField.addTarget(self, action: #selector(textFieldDidChangeText(_:)), for: .editingChanged)
        self.loginButton.addTarget(self, action: #selector(loginButtonDidTap(_:)), for: .touchUpInside)
        
        self.view.addSubview(self.usernameTextField)
        self.view.addSubview(self.userpwdTextField)
        self.view.addSubview(self.loginButton)
        
        self.usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(self.topLayoutGuide.snp.bottom).offset(15)
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalTo(35)
        }
        
        self.userpwdTextField.snp.makeConstraints { make in
            make.top.equalTo(self.usernameTextField.snp.bottom).offset(10)
            make.left.right.height.equalTo(self.usernameTextField)
        }
        
        self.loginButton.snp.makeConstraints { make in
            make.top.equalTo(self.userpwdTextField.snp.bottom).offset(15)
            make.left.right.equalTo(self.usernameTextField)
            make.height.equalTo(40)
        }
    }
    
    @objc private func textFieldDidChangeText(_ textField: UITextField){
        textField.backgroundColor = .white
        print("textFieldDidChangeText")
    }
    
    @objc private func loginButtonDidTap(_ sender: Any){
        print("loginButtonDidTap")
        guard let username = self.usernameTextField.text, !username.isEmpty else { return }
        guard let userpwd = self.userpwdTextField.text , !userpwd.isEmpty else { return }
        
        self.usernameTextField.isEnabled = false
        self.userpwdTextField.isEnabled = false
        self.loginButton.isEnabled = false
        self.loginButton.alpha = 0.4
        
        AuthService.login(username: username, password: userpwd) { response in
            switch response.result {
            case .success :
                AppDelegate.instance?.presentMainSreen()
            case .failure(let error):
                print("로그인 실패 ㅠㅠ", error)
                self.usernameTextField.isEnabled = true
                self.userpwdTextField.isEnabled = true
                self.loginButton.isEnabled = true
                self.loginButton.alpha = 1
                
                switch response.errorInfo()?.field {
                case .some("username"):
                    self.usernameTextField.becomeFirstResponder()
                    self.usernameTextField.backgroundColor = UIColor.red.withAlphaComponent(0.5)
                case .some("password"):
                    self.userpwdTextField.becomeFirstResponder()
                    self.userpwdTextField.backgroundColor = UIColor.red.withAlphaComponent(0.5)
                default:
                    break
                }
            }
        }
        
        
    }
}
