//
//  Form.swift
//  YemomoApp
//
//  Created by 叶墨沫 on 2024/7/12.
//

import Foundation

struct UserInfo{
    
    var name: String;
    var age: String;
    var address: String;
    var phone: String;
}

struct RegisterUserInfo {
    var email: String = ""
    var password: String = ""
    var ensureParssword: String = ""
}




extension UserInfo{
    init(){
        self.name = "";
        self.age = "";
        self.address = "";
        self.phone = "";
    }
}
