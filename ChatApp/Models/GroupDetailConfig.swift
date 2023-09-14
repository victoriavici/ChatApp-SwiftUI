//
//  GroupDetailConfig.swift
//  ChatApp
//
//  Created by Sebastian Mraz on 14/09/2023.
//

import Foundation
import SwiftUI

struct GroupDetailConfig {
    
    var chatText: String = ""
    var sourceType: UIImagePickerController.SourceType?
    var selectedImage: UIImage?
    var showOptions: Bool = false
    
    mutating func closeForm() {
        chatText = ""
        selectedImage = nil
    }
    
    var isValid: Bool {
        !chatText.isEmptyOrWhiteSpace || selectedImage != nil
    }
    
}
