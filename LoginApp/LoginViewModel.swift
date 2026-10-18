//
//  LoginViewModel.swift
//  LoginApp
//
//  Created by Bathi on 18/10/26.
//



import Foundation
import Combine

final class LoginViewModel: ObservableObject {

    @Published var message = ""

    func validate(email: String, password: String) -> Bool {
        guard !email.isEmpty else {
            message = "Email is required"
            return false
        }

        guard email.contains("@") else {
            message = "Invalid email"
            return false
        }

        guard password.count >= 8 else {
            message = "Password must be at least 8 characters"
            return false
        }

        message = "Login successful"
        return true
    }
}
