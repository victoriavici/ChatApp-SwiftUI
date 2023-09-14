//
//  LoginView.swift
//  ChatApp
//
//  Created by Sebastian Mraz on 25/08/2023.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject private var appState: AppState
    
    private var isFormValid: Bool {
        !email.isEmpty && !password.isEmpty
    }
    
    private func login() async {
        
        do {
      
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            appState.routes.append(.main)
        } catch {
            appState.errorWrapper = ErrorWrapper(error: error)
        }
    }
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
                .textInputAutocapitalization(.never)
            
            HStack {
                Spacer()
                Button("Sign up") {
                    appState.routes.append(.signUp)
                }
                .buttonStyle(.borderless)
                
                Button {
                    Task {
                        await login()
                    }
                } label: {
                    Text("Login")
                }
                .disabled(!isFormValid)
                .buttonStyle(.borderless)
                
                Spacer()
            }
            
        }
    }
    
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
                .environmentObject(AppState())
        }
    }
}
