//
//  ChatMessageInputView.swift
//  ChatApp
//
//  Created by Sebastian Mraz on 14/09/2023.
//

import SwiftUI

struct ChatMessageInputView: View {
    
    @Binding var groupDetailConfig: GroupDetailConfig
    @FocusState var isChatTextFieldFocused: Bool
    var onSendMessage: () -> Void
    
    
    var body: some View {
        HStack {
            Button {
                groupDetailConfig.showOptions = true
            } label: {
                Image(systemName: "plus")
            }
            
            TextField("Enter text here", text: $groupDetailConfig.chatText)
                .textFieldStyle(.roundedBorder)
                .focused($isChatTextFieldFocused)
            
            Button {
                if groupDetailConfig.isValid {
                    onSendMessage()
                }
            } label: {
                Image(systemName: "paperplane.circle.fill")
                    .font(.largeTitle)
                    .rotationEffect(Angle(degrees: 44))
            }
        }
    }
}

struct ChatMessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageInputView(groupDetailConfig: .constant(GroupDetailConfig(chatText: "Hello")), onSendMessage: { })
    }
}
