//
//  GroupDetailView.swift
//  ChatApp
//
//  Created by Sebastian Mraz on 31/08/2023.
//

import SwiftUI
import FirebaseAuth

struct GroupDetailView: View {
    let group: Group
    @State private var chatText: String = ""
    @EnvironmentObject private var model: Model
    
    private func sendMessage() async throws {
        
        guard let currentUser = Auth.auth().currentUser else { return }
        
        let chatMessage = ChatMessage(text: chatText, uid: Auth.auth().currentUser!.uid, displayName: currentUser.displayName ?? "Guets")
        
        try await model.saveChatMessageToGroup(chatMessage: chatMessage, group: group)
    }
    
    var body: some View {
        VStack{
            
            ScrollViewReader { proxy in
                ChatMessageListView(chatMessages: model.chatMessages)
                    .onChange(of: model.chatMessages) { newValue in
                        if !model.chatMessages.isEmpty {
                            let lastChatMessage = model.chatMessages[model.chatMessages.endIndex - 1]
                            withAnimation {
                                proxy.scrollTo(lastChatMessage.id, anchor: .bottom)
                            }
                        }
                    }
            }
            
            Spacer()
            TextField("Enter chat message", text: $chatText)
            Button("Send") {
                Task {
                    do {
                        try await sendMessage()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }.padding()
            .onDisappear {
                model.detachFirebaseListener()
            }
            .onAppear {
                model.listenForChatMessages(in: group)
            }
        
    }
}

struct GroupDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GroupDetailView(group: Group(subject: "Movies"))
            .environmentObject(Model())
    }
}
