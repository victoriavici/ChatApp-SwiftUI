//
//  SettingView.swift
//  ChatApp
//
//  Created by Sebastian Mraz on 01/09/2023.
//

import SwiftUI
import FirebaseAuth

struct SettingsConfig {
    var showPhotoOptions: Bool = false
    var sourceType: UIImagePickerController.SourceType?
    var selectedImage: UIImage?
    var displayName: String = ""
}

struct SettingView: View {
    
    @State private var settingsConfig = SettingsConfig()
    @FocusState var isEditing: Bool
    
    var displayName: String {
        guard let currentUser = Auth.auth().currentUser else {
            return "Guest"
        }
        return currentUser.displayName ?? "Guest"
    }
    
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle.fill")
                .rounded()
                .onTapGesture {
                    settingsConfig.showPhotoOptions = true
                }.confirmationDialog("Select", isPresented: $settingsConfig.showPhotoOptions) {
                    Button("Camera") {
                        settingsConfig.sourceType = .camera
                    }
                    Button("Photo Library") {
                        settingsConfig.sourceType = .photoLibrary
                    }
                }
            TextField(settingsConfig.displayName, text: $settingsConfig.displayName)
                .textFieldStyle(.roundedBorder)
                .focused($isEditing)
                .textInputAutocapitalization(.never)
            
            Spacer()
            
            Button("Signout") {
                
            }
        }
        .sheet(item: $settingsConfig.sourceType, content: { sourceType in
            ImagePicker(sourceType: sourceType, image: $settingsConfig.selectedImage)
        })
        .padding()
            .onAppear {
                settingsConfig.displayName = displayName
            }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
