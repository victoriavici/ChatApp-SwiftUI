//
//  SignUpView.swift
//  ChatApp
//
//  Created by Sebastian Mraz on 24/08/2023.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var displayName: String = ""
    @State private var errorMassage: String = ""
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var model: Model
    
    private var isFormValid: Bool {
        !email.isEmpty && !password.isEmpty && !displayName.isEmpty
    }
    
    
    private func signUp() async {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            try await model.updateDisplayName(for: result.user, displayName: displayName)
            appState.routes.append(.login)
        } catch {
            errorMassage = error.localizedDescription
            print(error)
        }
    }
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
                .textInputAutocapitalization(.never)
            TextField("Display name", text: $displayName)
                .textInputAutocapitalization(.never)
            
            HStack {
                Spacer()
                Button("Sign up") {
                    Task {
                        await signUp()
                    }
                }
                .disabled(!isFormValid)
                .buttonStyle(.borderless)
                
                Button {
                    appState.routes.append(.login)
                } label: {
                    Text("Login")
                }
                .buttonStyle(.borderless)
                
                Spacer()
            }
            Text(errorMassage)
        
        }
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(Model())
            .environmentObject(AppState())
    }
}
