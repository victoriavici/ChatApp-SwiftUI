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
    
    var body: some View {
        HStack {
            
            //photo
            
            VStack(alignment: .leading, spacing: 5) {
                Text(chatMessage.displayName)
                    .opacity(0.8)
                    .font(.caption)
                    .foregroundColor(.white)
                
                //url
                
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
            
            
            //photo
        }
        .listRowSeparator(.hidden)
        .overlay(alignment: direction == .left ? .bottomLeading : .bottomTrailing) {
            Image(systemName: "arrowtriangle.down.fill")
                .font(.title)
                .rotationEffect(.degrees(direction == .left ? 45 : -45))
                .offset(x: direction == .left ? 30 : -30, y: 10)
                .foregroundColor(color)
                
        }
    }
}

struct ChatMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageView(chatMessage: ChatMessage(text: "AAA", uid: "AC", dateCreated: Date(), displayName: "BB"), direction: .right, color: .blue)
    }
}
