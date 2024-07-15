//
//  FormView.swift
//  YemomoApp
//
//  Created by 叶墨沫 on 2024/7/12.
//

// intro: Environment 的使用很简单， environment key

import SwiftUI
import FirstTextFieldInput

func checkIsValidEmail(_ email: String) -> Bool{
    //检查邮箱格式 ，应为 xxx@xxx.com
    let emailReg = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
    let emailTest = NSPredicate(format: "SELF MATCHES %@", emailReg)
    return emailTest.evaluate(with: email)
}


struct FormView: View {
    @State var userInfo = UserInfo()
    @State var registerInfo = RegisterUserInfo()
    @State var isValidEmail = true
    @State var passwordIsValid = true
    private func checkEmpty() -> Bool{
        return registerInfo.email.isEmpty || registerInfo.password.isEmpty || registerInfo.ensureParssword.isEmpty
    }
    
    private func checkPassword() -> Bool{
        return (registerInfo.password == registerInfo.ensureParssword ) && registerInfo.password != ""
    }
    var body: some View {
        VStack {
            List {
                // 遍历key返回
                Section("基本信息") {
                    TextInputField("Name", value: $userInfo.name)
                    TextInputField("age", value: $userInfo.age)
                }.showClearButton()

                Section("注册用户信息") {
                    TextInputField("email", value: $registerInfo.email,isValid: $isValidEmail)
                        .onValid{ value in
                            if (checkIsValidEmail(value)){
                                return .success(true)
                            }else{
                                return .failure(ValidError(message: "please enter valid email address"))
                            }
                        }
                    TextInputField("password", value: $registerInfo.password,isValid: $passwordIsValid)
                        .onValid{value in
                                if (registerInfo.password == registerInfo.ensureParssword){
                                    return .success(true)
                                }else{
                                    return .failure(ValidError(message: "password is not same"))
                                }
                            }
                    TextInputField("ensurePassword", value: $registerInfo.ensureParssword,
                    isValid: $passwordIsValid)
                    .onValid{value in
                        if (registerInfo.password == registerInfo.ensureParssword){
                            return .success(true)
                        }else{
                            return .failure(ValidError(message: "password is not same"))
                        }

                    }
                }.required()
                HStack(){
                    Spacer()
                    Button(action: {
                        print(userInfo)
                        print(registerInfo)
                    }) {
                        Text("提交")
                    }
                    .disabled(checkEmpty() || !checkPassword())
                    Spacer()
                        
                }
                
            }
        }
    }
}

#Preview {
    FormView()
}
