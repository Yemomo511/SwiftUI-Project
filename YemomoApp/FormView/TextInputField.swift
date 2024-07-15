//
//  TextInputFiled.swift
//  YemomoApp
//
//  Created by 叶墨沫 on 2024/7/15.
//

import SwiftUI

struct TextInputField: View {
    var title: String
    
    @Binding var value: String
    @Binding var isValid: Bool
    @State var isValidMessage: String = ""
    @Environment(\.showClearButton) var isShowClearButton: Bool
    @Environment(\.required) var required: Bool
    @Environment(\.onValid) var validMethod: ValidMethod?
    init(_ title: String, value: Binding<String>,
         isValid: Binding<Bool> = .constant(true)) {
        self.title = title
        self._value = value
        self._isValid = isValid
    }

    var clearButton: some View {
        HStack {
            Spacer()
            Button(action: {
                value = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundStyle(Color(UIColor.gray))
            }
        }
    }

    func textChange(value: String) {
        guard let validMethod = validMethod else { return }
        let result = validMethod(value)
        if case let .failure(error) = result {
            isValid = false
            isValidMessage = error.localizedDescription
        }else{
            isValid = true
        }
        
    }

    var emptyText: some View {
        Text("not empty")
            .foregroundStyle(.red)
            .offset(y: -20)
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                Text(isValid || value.isEmpty ? title : isValidMessage)
                    .foregroundStyle(
                        value.isEmpty
                            ? Color(.placeholderText)
                            : isValid ? .blue : .red
                    )
                    .offset(y: value.isEmpty ? 0 :-20)
                    .scaleEffect(0.9, anchor: .leading)
            }

            required && value.isEmpty ? emptyText : nil

            TextField("", text: $value)
                .padding(.trailing)
                .onChange(of: value) { newValue in
                    textChange(value: newValue)
                }
                .overlay {
                    isShowClearButton ? clearButton : nil
                }
        }
        .padding(.top)
        .animation(.default, value: value)
    }
}

struct ValidError: Error {
    var message: String
}

extension ValidError: LocalizedError {
    var errorDescription: String? {
        message
    }
}

// env key
private struct TextInputFieldShowClearButton: EnvironmentKey {
    static var defaultValue: Bool = false
}

// env key
private struct TextInputFieldRequired: EnvironmentKey {
    static var defaultValue: Bool = false
}

typealias ValidMethod = (String) -> Result<Bool, Error>

// 检验输入是否合格的方法
private struct TextInputValid: EnvironmentKey {
    static var defaultValue: ValidMethod?
}

// env value
extension EnvironmentValues {
    var showClearButton: Bool {
        get { self[TextInputFieldShowClearButton.self] }
        set { self[TextInputFieldShowClearButton.self] = newValue }
    }

    var required: Bool {
        get { self[TextInputFieldRequired.self] }
        set { self[TextInputFieldRequired.self] = newValue }
    }

    var onValid: ValidMethod? {
        get { self[TextInputValid.self] }
        set { self[TextInputValid.self] = newValue }
    }
}

// 给 TextInputField 写 modify 来保证更好的修饰
extension View {
    // modify 需要返回视图，这里面可以做一点处理
    func showClearButton() -> some View {
        environment(\.showClearButton, true)
    }

    func required() -> some View {
        environment(\.required, true)
    }

    func onValid(_ method: @escaping ValidMethod) -> some View {
        environment(\.onValid, method)
    }
}

#Preview("Text Input Field") {
    @State var text = ""
    @State var isValid = true
    return 
    TextInputField("default", value: $text,isValid: $isValid)
        .required()
        .onValid{ value in
            if value.count < 5 {
                return .failure(ValidError(message: "长度小于5"))
            }else{
                return .success(true)
            }
        }
}
