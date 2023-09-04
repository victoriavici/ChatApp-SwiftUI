//
//  ImagePicker.swift
//  ChatApp
//
//  Created by Sebastian Mraz on 01/09/2023.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.dismiss) private var dismiss
    typealias UIViewControllerType = UIImagePickerController
    typealias Coordinator = ImagePickerCoordinator
    var sourceType: UIImagePickerController.SourceType = .camera
    @Binding var image: UIImage?
    
    func makeCoordinator() -> ImagePicker.Coordinator {
        return ImagePickerCoordinator(picker: self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        var picker: ImagePicker
        
        init(picker: ImagePicker) {
            self.picker = picker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if  let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                self.picker.image = uiImage
            }
            self.picker.dismiss()
        }
    
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.picker.dismiss()
        }
    }
    
    
}
