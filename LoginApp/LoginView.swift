//
//  LoginView.swift
//  LoginApp
//
//  Created by Bathi on 18/10/26.
//


import SwiftUI

struct LoginView: View {

    @StateObject private var viewModel = LoginViewModel()

    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 16) {
            Text("Login")
                .font(.largeTitle.bold())

            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            Button("Login") {
                viewModel.validate(
                    email: email,
                    password: password
                )
            }
            .buttonStyle(.borderedProminent)

            Text(viewModel.message)
                .foregroundStyle(
                    viewModel.message == "Login successful"
                    ? .green : .red
                )
        }
        .padding()
    }
}
