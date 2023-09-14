//
//  ChatMessageView.swift
//  ChatApp
//
//  Created by Sebastian Mraz on 01/09/2023.
//

import SwiftUI


enum ChatMessageDirection {
    case left
    case right
}

struct ChatMessageView: View {
    
    let chatMessage: ChatMessage
    let direction: ChatMessageDirection
    let color: Color
    
    @ViewBuilder
    private func profilePhotoForChattMessage(chatMessage: ChatMessage) -> some View {
        if let profilePhotoURL = chatMessage.displayProfilePhotoURL {
            AsyncImage(url: profilePhotoURL) { image in
                image.rounded(width: 34, height: 34)
            } placeholder: {
                Image(systemName: "person.crop.circle")
                    .font(.title)
            }
        } else {
            Image(systemName: "person.crop.circle")
                .font(.title)
        }
    }
    
    var body: some View {
        HStack {
            
            if direction == .left {
                profilePhotoForChattMessage(chatMessage: chatMessage)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(chatMessage.displayName)
                    .opacity(0.8)
                    .font(.caption)
                    .foregroundColor(.white)
                
                if let attachmentPhotoURL = chatMessage.displayAttachmentPhotoURL {
                    AsyncImage(url: attachmentPhotoURL) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView("Loading...")
                    }
                    
                }
                
                Text(chatMessage.text)
                Text(chatMessage.dateCreated, format: .dateTime)
                    .font(.caption)
                    .opacity(0.4)
                    .frame(maxWidth: 200, alignment: .trailing)
            }
            .padding(8)
            .background(color)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))

        }
        .listRowSeparator(.hidden)
        .overlay(alignment: direction == .left ? .bottomLeading : .bottomTrailing) {
            Image(systemName: "arrowtriangle.down.fill")
                .font(.title)
                .rotationEffect(.degrees(direction == .left ? 45 : -45))
                .offset(x: direction == .left ? 30 : -30, y: 10)
                .foregroundColor(color)
                
        }
        if direction == .right {
            profilePhotoForChattMessage(chatMessage: chatMessage)
        }
    }
}

struct ChatMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageView(chatMessage: ChatMessage(text: "AAA", uid: "AC", dateCreated: Date(), displayName: "BB"), direction: .right, color: .blue)
    }
}
